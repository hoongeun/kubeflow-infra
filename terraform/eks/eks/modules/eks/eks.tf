module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "${var.name}-${replace(var.cluster_version, ".", "-")}"
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = data.aws_vpc.vpc.id
  subnet_ids = data.aws_subnets.private.ids

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 20
    capacity_type  = "ON_DEMAND"
    instance_types = ["m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    for k, v in var.eks_managed_nodegroups : k => merge(
      v,
      {
        name         = k
        desired_size = lookup(v, "desired_size", v.min_size)
      },
    )
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true

  aws_auth_roles = concat(
    [for user in var.users_admin : {
      rolearn  = "arn:aws:iam::${var.aws_account_id}:role/kubeflow-admin"
      username = user
      groups   = ["system:masters"]
    }],
    [for user in var.users_developer : {
      rolearn  = "arn:aws:iam::${var.aws_account_id}:role/kubeflow-developer"
      username = user
      groups = [
        "system:authenticated",
      ]
    }]
  )

  aws_auth_users = concat(
    [for user in var.users_admin : {
      userarn  = "arn:aws:iam::${var.aws_account_id}:role/${user}"
      username = user
      groups   = ["system:masters"]
    }],
    [for user in var.users_developer : {
      userarn  = "arn:aws:iam::${var.aws_account_id}:role/${user}"
      username = user
      groups = [
        "system:authenticated",
      ]
    }]
  )

  aws_auth_accounts = [
    var.aws_account_id
  ]

  cluster_additional_security_group_ids = [
    aws_security_group.cluster.id
  ]
}
