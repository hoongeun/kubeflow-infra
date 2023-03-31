terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "kubeflow-tfstate"
    key            = "dev-apne1/iam/dev-kubeflow-usergroup-apne1/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "kubeflow-tflock"
  }
}
