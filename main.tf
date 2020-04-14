module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  namespace   = var.namespace
  stage       = var.stage
  environment = var.environment
  name        = var.name
  attributes  = var.attributes
  delimiter   = var.delimiter
  tags        = var.tags
}

locals {
  name = var.short_name ? module.label.name : module.label.id
}

resource "aws_ecr_repository" "repo" {
  name = local.name

  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.image_scan_on_push
  }

  tags = module.label.tags
}

resource "aws_ecr_lifecycle_policy" "repo-policy" {
  repository = aws_ecr_repository.repo.name

  policy =  var.policy
}
