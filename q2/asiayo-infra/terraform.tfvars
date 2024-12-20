# base
project_name = "asiayo"
environment  = "prod"
region       = "ap-northeast-1"


# VPC
vpc_cidr     = "172.16.0.0/16"
azs          = ["ap-northeast-1a", "ap-northeast-1c"]
private_subnets = ["172.16.1.0/24", "172.16.2.0/24"]
public_subnets  = ["172.16.101.0/24", "172.16.102.0/24"]

# EKS
cluster_name     = "asiayo-eks"
cluster_version  = "1.27"
instance_types   = ["t3.medium"]
min_size         = 2
max_size         = 5
desired_size     = 2

# tag
tags = {
 Environment = "neil-test"
 Project     = "asiayo"
 Terraform   = "true"
 Owner       = "devops"
}