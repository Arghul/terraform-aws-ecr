# Terraform AWS ECR repository

Terraform module to create AWS ECR repository


## Prerequisites
This module has a few dependencies:
* Terraform 0.12

## Examples
```hcl-terraform
module "ecr_rpo" {
  source = "git::https://github.com/arghul/terraform-aws-ecr.git?ref=master"

  name = "api"
  namespace = "arghul"
  environment = "prod"
}
```
