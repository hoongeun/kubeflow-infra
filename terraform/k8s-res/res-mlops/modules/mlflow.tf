variable "enable_mlflow" {
  type    = bool
  default = true
}

resource "helm_release" "mlflow" {
  count      = var.enable_mlflow ? 1 : 0
  name       = "mlflow"
  chart      = "community-charts"
  repository = "https://community-charts.github.io/helm-charts"
  version    = "1.0.1"
  namespace  = "mlflow"

  values = [<<EOT

    EOT
  ]
}
