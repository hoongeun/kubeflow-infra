variable "enable_minio" {
  type    = bool
  default = true
}

resource "kubernetes_deployment" "minio" {
  count = var.enable_minio ? 1 : 0
  metadata {
    name      = "minio"
    namespace = "minio"
  }
}

resource "kubernetes_deployment_v1" "minio" {
  count = var.enable_minio ? 1 : 0
  metadata {
    name      = "minio"
    namespace = "minio"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "minio"
      }
    }

    template {
      metadata {
        labels = {
          app = "minio"
        }
      }

      spec {
        volume {
          name = "minio-pvc"
          persistent_volume_claim {
            claim_name = "minio-pvc"
          }
        }

        container {
          name  = "minio"
          image = "minio/minio:RELEASE.2021-04-22T15-44-28Z.hotfix.56647434e"
          resources {
            limits = {
              cpu    = "500m"
              memory = "0.5Gi"
            }

            requests = {
              cpu    = "400m"
              memory = "0.4Gi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "minio_pvc" {
  count = var.enable_minio ? 1 : 0

  metadata {
    name      = "minio-pvc"
    namespace = "minio"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}

resource "kubernetes_service_v1" "minio_svc" {
  count = var.enable_minio ? 1 : 0
  metadata {
    name      = "minio-svc"
    namespace = "minio"
  }

  spec {
    selector = {
      app = "minio"
    }

    port {
      port = 9000
    }
  }
}
