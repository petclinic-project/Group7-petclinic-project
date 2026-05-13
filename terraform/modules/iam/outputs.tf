output "eks_cluster_role_arn" {
  description = "EKS cluster IAM role ARN"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "EKS node IAM role ARN"
  value       = aws_iam_role.eks_node.arn
}

output "github_actions_role_arn" {
  description = "GitHub Actions IAM role ARN"
  value       = aws_iam_role.github_actions.arn
}

output "argocd_role_arn" {
  description = "ArgoCD IAM role ARN"
  value       = aws_iam_role.argocd.arn
}

output "github_oidc_provider_arn" {
  description = "GitHub OIDC provider ARN"
  value       = aws_iam_openid_connect_provider.github.arn
}

output "ebs_csi_driver_role_arn" {
  description = "EBS CSI driver IAM role ARN"
  value       = aws_iam_role.ebs_csi_driver.arn
}
