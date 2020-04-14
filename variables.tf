variable "name" {
  description = "Service name"
}

variable "namespace" {
  description = "Service namespace (eg: api, web, ops)"
}

variable "stage" {
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
  type        = string
}

variable "attributes" {
  description = "Additional attributes"
  type = list(string)
  default = []
}

variable "delimiter" {
  description = "Label delimiter"
  type = string
  default = "-"
}

variable "tags" {
  description = "Service tags"
  type = map(string)
  default = {}
}

variable "image_tag_mutability" {
  description = "Specifies whether image is MUTABLE or IMMUTABLE"
  type = string
  default = "MUTABLE"
}

variable "image_scan_on_push" {
  description = "Whether to security scan an image using clair"
  type = bool
  default = false
}

variable "short_name" {
  description = "Whether to use a short name for service or long (namespace-environment-(stage)-(attributes)-name)"
  type = bool
  default = false
}

variable "source_path" {
  description = "Path to docker image source"
  type = string
  default = ""
}

variable "policy" {
  default = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 2 any images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 2
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}