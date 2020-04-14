terraform {
  required_version = "~> 0.12.1"
}

provider "aws" {
  region = "eu-west-1"
}

module "ecr_rpo" {
  source = "../"
  name = "api1"
  namespace = "arghul"
  environment = "prod"
}