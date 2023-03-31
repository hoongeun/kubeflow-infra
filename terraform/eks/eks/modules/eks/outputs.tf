locals {}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "config_map_aws_auth" {
  value = module.eks.aws_auth_configmap_yaml
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}
