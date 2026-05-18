variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "petclinic"
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = "730883236482"
}

variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = "petclinic_prod"
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "petclinic_admin"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.small"
}

variable "eks_node_instance_type" {
  description = "EKS node instance type"
  type        = string
  default     = "t3.medium"
}

variable "eks_node_desired" {
  description = "Desired number of EKS nodes"
  type        = number
  default     = 3
}

variable "eks_node_min" {
  description = "Minimum number of EKS nodes"
  type        = number
  default     = 2
}

variable "eks_node_max" {
  description = "Maximum number of EKS nodes"
  type        = number
  default     = 6
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name for app code"
  type        = string
}
