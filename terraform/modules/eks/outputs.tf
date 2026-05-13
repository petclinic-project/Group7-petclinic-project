output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_ca_certificate" {
  description = "EKS cluster CA certificate"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_version" {
  description = "EKS cluster version"
  value       = aws_eks_cluster.main.version
}

output "oidc_provider_arn" {
  description = "EKS OIDC provider ARN"
  value       = aws_iam_openid_connect_provider.eks.arn
}

output "oidc_provider_url" {
  description = "EKS OIDC provider URL"
  value       = replace(aws_eks_cluster.main.identity[0].oidc[0].issuer, "https://", "")
}

output "node_group_name" {
  description = "EKS node group name"
  value       = aws_eks_node_group.main.node_group_name
}

output "node_group_status" {
  description = "EKS node group status"
  value       = aws_eks_node_group.main.status
}
