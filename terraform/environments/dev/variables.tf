variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "petclinic"
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
  default     = "527582557964"
}

variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = "petclinic"
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
  default     = "db.t3.micro"
}

variable "eks_node_instance_type" {
  description = "EKS node instance type"
  type        = string
  default     = "t3.medium"
}

variable "eks_node_desired" {
  description = "Desired number of EKS nodes"
  type        = number
  default     = 2
}

variable "eks_node_min" {
  description = "Minimum number of EKS nodes"
  type        = number
  default     = 2
}

variable "eks_node_max" {
  description = "Maximum number of EKS nodes"
  type        = number
  default     = 4
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name for app code"
  type        = string
}
# test
