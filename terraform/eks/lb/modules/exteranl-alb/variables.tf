variable "vpc" {
  type = string
}

variable "name" {
  description = "Name of the external application load balancer"
  type        = string
}

variable "tags" {
  type = map(string)
}
