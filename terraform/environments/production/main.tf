module "vpc" {
  source      = "../../Modules/vpc"
  environment = var.environment
  project     = var.project
  aws_region  = var.aws_region
}

module "security_groups" {
  source      = "../../Modules/security-groups"
  environment = var.environment
  project     = var.project
  vpc_id      = module.vpc.vpc_id
  vpc_cidr    = module.vpc.vpc_cidr
}

module "iam" {
  source            = "../../Modules/iam"
  environment       = var.environment
  project           = var.project
  aws_account_id    = var.aws_account_id
  aws_region        = var.aws_region
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
  github_org        = var.github_org
  github_repo       = var.github_repo
}

module "ecr" {
  source         = "../../Modules/ecr"
  environment    = var.environment
  project        = var.project
  aws_account_id = var.aws_account_id
}

module "rds" {
  source                = "../../Modules/rds"
  environment           = var.environment
  project               = var.project
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_instance_class     = var.db_instance_class
  private_subnet_ids    = module.vpc.private_subnet_ids
  rds_security_group_id = module.security_groups.rds_sg_id
}

module "eks" {
  source                  = "../../Modules/eks"
  environment             = var.environment
  project                 = var.project
  aws_region              = var.aws_region
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  public_subnet_ids       = module.vpc.public_subnet_ids
  eks_cluster_role_arn    = module.iam.eks_cluster_role_arn
  eks_node_role_arn       = module.iam.eks_node_role_arn
  eks_cluster_sg_id       = module.security_groups.eks_cluster_sg_id
  eks_node_sg_id          = module.security_groups.eks_node_sg_id
  eks_node_instance_type  = var.eks_node_instance_type
  eks_node_desired        = var.eks_node_desired
  eks_node_min            = var.eks_node_min
  eks_node_max            = var.eks_node_max
  ebs_csi_driver_role_arn = module.iam.ebs_csi_driver_role_arn
}
