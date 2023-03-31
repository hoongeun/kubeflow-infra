locals {
  name   = "dev-apne1"
  region = "ap-northeast-1"
  env    = "dev"
}

module "dev_apne1" {
  source = "../modules/base"

  region          = local.region
  name            = local.name
  env             = local.env
  bastion_keypair = "kubeflow-keypair"
  bastion_ingress = ["0.0.0.0/0"] # CAUSTION: Any Open, You have to specify vpn address for security
}
