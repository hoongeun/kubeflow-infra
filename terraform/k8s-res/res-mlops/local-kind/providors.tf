provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-mlops"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "kind-mlops"
  }
}

provider "http" {
}
