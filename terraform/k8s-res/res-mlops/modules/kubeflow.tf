variable "enable_kubeflow" {
  type    = bool
  default = true
}

resource "helm_release" "kubeflow" {
  count     = var.enable_kubeflow ? 1 : 0
  name      = "kubeflow"
  chart     = "kubeflow"
  namespace = "kubeflow"
}
