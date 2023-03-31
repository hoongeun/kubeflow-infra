variable "vpc" {
  type = string
}


variable "name" {
  description = "Name of the internal network load balancer"
  type        = string
}

variable "tags" {
  type = map(string)
}
