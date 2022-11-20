locals {
  name   = "dev-kubeflow-data-apne2"
  region = "ap-northeast-2"
}

module "dev-data" {
  source = "../modules/base"

  region = local.region
  name   = local.name
}
