output "repository_urls" {
  description = "ECR repository URLs"
  value       = { for k, v in aws_ecr_repository.services : k => v.repository_url }
}

output "repository_arns" {
  description = "ECR repository ARNs"
  value       = { for k, v in aws_ecr_repository.services : k => v.arn }
}

output "registry_id" {
  description = "ECR registry ID"
  value       = values(aws_ecr_repository.services)[0].registry_id
}
