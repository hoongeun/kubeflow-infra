locals {
  vpc    = "dev-apne1"
  region = "ap-northeast-1"

  name            = "dev-kubeflow-apne1"
  cluster_version = "1.24"

  aws_account_id = "289730667554"

  tags = {}
}

module "dev_kubeflow_apne1" {
  source = "../modules/eks"

  name   = local.name
  vpc    = local.vpc
  region = local.region

  aws_account_id  = local.aws_account_id
  cluster_version = local.cluster_version

  eks_managed_nodegroups = {
    "sys" = {
      instance_types = ["m5n.large"]
      min_size       = 1
      max_size       = 3

      labels = {
        "kubeflow.hoongeun.com/nodegroup" = "sys"
      }
      taints = {}
    },
    "spark-r5-xlarge" = {
      instance_types = ["r5.2xlarge"]
      min_size       = 0
      max_size       = 4

      labels = {
        "kubeflow.hoongeun.com/nodegroup" = "spark-r5-xlarge"
      }

      taints = {
        "kubeflow.hoongeun.com/nodegroup" = {
          key    = "kubeflow.hoongeun.com/nodegroup"
          value  = "spark-r5-xlarge"
          effect = "NO_SCHEDULE"
        }
      }
    }
  }

  users_admin = [
    "hoongeun",
  ]
}
