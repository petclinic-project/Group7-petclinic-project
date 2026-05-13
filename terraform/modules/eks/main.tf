# EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = "${var.project}-${var.environment}-eks"
  role_arn = var.eks_cluster_role_arn
  version  = "1.32"

  vpc_config {
    subnet_ids              = concat(var.private_subnet_ids, var.public_subnet_ids)
    security_group_ids      = [var.eks_cluster_sg_id]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  tags = {
    Name = "${var.project}-${var.environment}-eks"
  }

  depends_on = [var.eks_cluster_role_arn]
}

# Launch Template for EKS Nodes
resource "aws_launch_template" "eks_nodes" {
  name                   = "${var.project}-${var.environment}-eks-node-lt"
  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 50
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  network_interfaces {
    security_groups = [var.eks_node_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project}-${var.environment}-eks-node"
    }
  }
}

# EKS Node Group
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project}-${var.environment}-node-group"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.private_subnet_ids

  instance_types = [var.eks_node_instance_type]

  scaling_config {
    desired_size = var.eks_node_desired
    min_size     = var.eks_node_min
    max_size     = var.eks_node_max
  }

  update_config {
    max_unavailable = 1
  }

  launch_template {
    name    = aws_launch_template.eks_nodes.name
    version = aws_launch_template.eks_nodes.default_version
  }

  tags = {
    Name = "${var.project}-${var.environment}-node-group"
  }

  depends_on = [var.eks_node_role_arn]
}

# OIDC Provider for EKS
data "tls_certificate" "eks" {
  url = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.main.identity[0].oidc[0].issuer

  tags = {
    Name = "${var.project}-${var.environment}-eks-oidc"
  }
}

# EKS Addons
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "vpc-cni"

  tags = {
    Name = "${var.project}-${var.environment}-vpc-cni"
  }
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "coredns"

  tags = {
    Name = "${var.project}-${var.environment}-coredns"
  }

  depends_on = [aws_eks_node_group.main]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "kube-proxy"

  tags = {
    Name = "${var.project}-${var.environment}-kube-proxy"
  }
}

resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name             = aws_eks_cluster.main.name
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = var.ebs_csi_driver_role_arn

  tags = {
    Name = "${var.project}-${var.environment}-ebs-csi-driver"
  }

  depends_on = [aws_eks_node_group.main]
}
