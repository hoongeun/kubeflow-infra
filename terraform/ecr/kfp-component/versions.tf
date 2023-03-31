terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "hoongeun-tfstate"
    key            = "dev-kubeflow-apne2/ecr/kfp-compoennt/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "dev-kubeflow-apne2-ecr-kfp-compoennt-tflock"
  }
}
