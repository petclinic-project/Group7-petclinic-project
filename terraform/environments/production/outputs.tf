output "vpc_id" {
  description = "Production VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Production public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Production private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "Production EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Production EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_ca_certificate" {
  description = "Production EKS cluster CA certificate"
  value       = module.eks.cluster_ca_certificate
  sensitive   = true
}

output "rds_endpoint" {
  description = "Production RDS MySQL endpoint"
  value       = module.rds.rds_endpoint
}

output "rds_port" {
  description = "Production RDS MySQL port"
  value       = module.rds.rds_port
}

output "ecr_repository_urls" {
  description = "Production ECR repository URLs"
  value       = module.ecr.repository_urls
}

output "github_actions_role_arn" {
  description = "Production GitHub Actions IAM role ARN"
  value       = module.iam.github_actions_role_arn
}

output "eks_cluster_role_arn" {
  description = "Production EKS cluster IAM role ARN"
  value       = module.iam.eks_cluster_role_arn
}

output "eks_node_role_arn" {
  description = "Production EKS node IAM role ARN"
  value       = module.iam.eks_node_role_arn
}
