variable "enable_mysql" {
  type    = bool
  default = true
}

resource "kubernetes_namespace_v1" "mysql" {
  metadata {
    name = "database"
  }
}

resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "database"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        volume {
          name = "mysql-pvc"
          persistent_volume_claim {
            claim_name = "mysql-pvc"
          }
        }

        container {
          name  = "mysql"
          image = "mysql:5.7"
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

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "root"
          }

          env {
            name  = "MYSQL_DATABASE"
            value = "mlflow"
          }

          env {
            name  = "MYSQL_USER"
            value = "mlflow"
          }

          env {
            name  = "MYSQL_PASSWORD"
            value = "mlflow"
          }

          volume_mount {
            name       = "mysql-pvc"
            mount_path = "/var/lib/mysql"
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "mysql" {
  metadata {
    name      = "mysql-pvc"
    namespace = "database"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}

resource "kubernetes_service" "mysql" {
  metadata {
    name      = "mysql-svc"
    namespace = "database"
  }

  spec {
    selector = {
      app = "mysql"
    }

    port {
      port = 3306
    }
  }
}
