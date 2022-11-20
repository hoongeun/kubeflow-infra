locals {
  name   = "dev-kubeflow-data-apne1"
  region = "ap-northeast-1"
}

module "dev-data" {
  source = "../modules/base"

  region = local.region
  name   = local.name
}
