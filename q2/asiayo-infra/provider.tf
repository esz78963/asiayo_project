terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # 指定版本約束
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}
#https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
#https://github.com/hashicorp/terraform-provider-kubernetes/blob/main/_examples/eks/README.md
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    command     = "aws"
  }

}

