
#https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name   = "${var.project_name}-vpc"
  cidr   = var.vpc_cidr
  
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  
  enable_nat_gateway = true
  enable_vpn_gateway = false
  
  tags = var.tags
}
#https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  
  eks_managed_node_groups = {
    general = {
      min_size       = var.min_size
      max_size       = var.max_size
      desired_size   = var.desired_size
      instance_types = var.instance_types
      
      labels = {
        Environment = var.environment
        Project     = var.project_name
      }
      
      tags = var.tags
    }
  }
}
