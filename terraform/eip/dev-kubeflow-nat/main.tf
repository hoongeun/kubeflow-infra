module "nat_a" {
  source = "../module/base"

  name = "dev-kubeflow-nat-a"
}

module "nat_c" {
  source = "../module/base"

  name = "dev-kubeflow-nat-c"
}
