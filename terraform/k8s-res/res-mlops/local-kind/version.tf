terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.4.2"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
  }
}
