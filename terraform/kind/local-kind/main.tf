module "mlops-cluster" {
  source = "../modules"

  name = "mlops"
}

module "app-cluster" {
  source = "../modules"

  name = "app"
}
