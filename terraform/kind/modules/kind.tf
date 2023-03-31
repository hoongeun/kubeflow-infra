variable "name" {
  type = string
}

resource "kind_cluster" "cluster" {
  name = var.name
}
