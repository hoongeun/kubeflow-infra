provider "aws" {
  region = local.region
}

provider "kind" {}

provider "kubernetes" {
  host                   = module.dev_kubeflow_apne1.cluster_endpoint
  cluster_ca_certificate = base64decode(module.dev_kubeflow_apne1.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.dev_kubeflow_apne1.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.dev_kubeflow_apne1.cluster_endpoint
    cluster_ca_certificate = base64decode(module.dev_kubeflow_apne1.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", module.dev_kubeflow_apne1.cluster_name]
    }
  }
}

provider "kubectl" {
  apply_retry_count      = 5
  host                   = module.dev_kubeflow_apne1.cluster_endpoint
  cluster_ca_certificate = base64decode(module.dev_kubeflow_apne1.cluster_certificate_authority_data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.dev_kubeflow_apne1.cluster_name]
  }
}
