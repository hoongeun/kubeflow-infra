locals {
  name = "kfp-component"
  region = "ap-northeast-2"
}

module "kfp-component" {
  source = "../modules/base"

  name = local.name
  tags = merge(local.tags, {
    name = local.name
  })
}
