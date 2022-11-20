locals {
  private_subnet_tags = {}

  public_subnet_tags = {}
}

resource "aws_vpc" "vpc" {
  cidr_block           = cidrsubnet(cidrsubnet("10.0.0.0/16", 4, index(local.regions, var.region)), 2, index(local.envs, var.env))
  enable_dns_hostnames = true

  tags = merge(local.tags, var.tags, {
    Name = var.name
  })
}

