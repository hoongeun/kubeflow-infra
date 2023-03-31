variable "enable_kserve" {
  type    = bool
  default = true
}

data "http" "kserve_kubeflow" {
  url = "https://github.com/kserve/kserve/releases/download/v0.9.0/kserve_kubeflow.yaml"

  # Optional request headers
  request_headers = {
    Accept = "application/yaml"
  }

  lifecycle {
    postcondition {
      condition     = contains([201, 204], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

resource "helm_release" "kserve" {
  count     = var.enable_kserve ? 1 : 0
  name      = "kserve"
  namespace = "kserve"
  chart     = "https://github.com/kserve/kserve/releases/download/v0.9.0/helm-chart-kserve-v0.9.0.tgz"
}

resource "kubernetes_manifest_v1" "kserve_kubeflow" {
  depends_on = [
    helm_release.kserve
  ]
  count    = var.enable_kserve ? 1 : 0
  manifest = yamldecode(data.http.kserve_kubeflow.body)
}
