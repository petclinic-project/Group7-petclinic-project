variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EKS nodes"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for load balancers"
  type        = list(string)
}

variable "eks_cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
  type        = string
}

variable "eks_node_role_arn" {
  description = "IAM role ARN for EKS nodes"
  type        = string
}

variable "eks_cluster_sg_id" {
  description = "Security group ID for EKS cluster"
  type        = string
}

variable "eks_node_sg_id" {
  description = "Security group ID for EKS nodes"
  type        = string
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for EKS nodes"
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

variable "ebs_csi_driver_role_arn" {
  description = "IAM role ARN for EBS CSI driver"
  type        = string
}
