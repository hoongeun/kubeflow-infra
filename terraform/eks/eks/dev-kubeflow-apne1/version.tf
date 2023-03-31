terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
  }

  backend "s3" {
    bucket         = "kubeflow-tfstate"
    key            = "dev-apne1/eks/dev-kubeflow-apne1/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "kubeflow-tflock"
  }
}
