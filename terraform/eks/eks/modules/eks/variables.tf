variable "name" {
  description = "name of eks cluster"
  type        = string
}

variable "vpc" {
  description = "vpc of cluster"
  type        = string
}

variable "cluster_version" {
  description = "eks version"
  type        = string
}

variable "eks_managed_nodegroups" {
  description = "eks managed nodegroups"
  type        = map(any)
}

variable "region" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "users_developer" {
  type    = list(string)
  default = []
}

variable "users_admin" {
  type = list(string)
}

variable "aws_account_id" {
  type = string
}
