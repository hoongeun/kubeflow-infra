locals {
  name   = "dev-kubeflow-apne1"
  region = "ap-northeast-1"

  tags = {
    env = "dev"
  }
}

module "dev-kubeflow-apne1-ext-alb" {
  source = "../modules/exteranl-alb"

  name = "dev-kubeflow-apne1"
  vpc  = "dev-apne1"

  tags = local.tags
}

module "dev-kubeflow-apne1-int-nlb" {
  source = "../modules/internal-nlb"

  vpc  = "dev-apne1"
  name = "dev-kubeflow-apne1"

  tags = local.tags
}
