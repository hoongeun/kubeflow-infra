locals {
  vpc      = "dev-apne2"
  username = "kubeflow-admin"
  password = "kubeflow-password" # NOTE: you have to change this password
}

module "dev-kubeflow-apne2" {
  source = "../modules/base"

  username = local.username
  password = local.password
}
