variable "region" {
  type        = string
  description = "region"
}

variable "env" {
  type        = string
  description = "env(dev, prod)"
}

variable "name" {
  type = string
}

variable "enable_bastion" {
  type    = bool
  default = false
}

variable "bastion_ingress" {
  description = "bastion ingress cidrs"
  type        = list(string)
}

variable "bastion_keypair" {
  description = "bastion keypair"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
