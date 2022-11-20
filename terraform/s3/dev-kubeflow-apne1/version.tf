terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "kubeflow-tfstate"
    key            = "dev-apne2/s3/dev-kubeflow-data-apne2/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "kubeflow-tflock"
  }
}
