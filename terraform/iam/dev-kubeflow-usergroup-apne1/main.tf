locals {
  name   = "dev-kubeflow-admin-apne1"
  region = "ap-northeast-1"

  aws_account_id = "289730667554"
}

module "dev-kubeflow-usergroup-apne1" {
  source = "../modules/base"

  name           = local.name
  aws_account_id = local.aws_account_id

  usergroups = {
    "admin"     = "",
    "developer" = ""
  }
}

