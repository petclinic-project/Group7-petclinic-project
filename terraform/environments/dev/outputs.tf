output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_ca_certificate" {
  description = "EKS cluster CA certificate"
  value       = module.eks.cluster_ca_certificate
  sensitive   = true
}

output "rds_endpoint" {
  description = "RDS MySQL endpoint"
  value       = module.rds.rds_endpoint
}

output "rds_port" {
  description = "RDS MySQL port"
  value       = module.rds.rds_port
}

output "ecr_repository_urls" {
  description = "ECR repository URLs"
  value       = module.ecr.repository_urls
}

output "github_actions_role_arn" {
  description = "GitHub Actions IAM role ARN"
  value       = module.iam.github_actions_role_arn
}

output "eks_cluster_role_arn" {
  description = "EKS cluster IAM role ARN"
  value       = module.iam.eks_cluster_role_arn
}

output "eks_node_role_arn" {
  description = "EKS node IAM role ARN"
  value       = module.iam.eks_node_role_arn
}
