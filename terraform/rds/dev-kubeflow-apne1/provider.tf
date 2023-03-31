locals {
  region  = "ap-northeast-2"
  service = "dev-kubeflow-apne2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-tfstate"
    key            = "/rds/${local.service}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "${local.service}-terraform-lock"
  }
}

provider "aws" {
  region = local.region
}
