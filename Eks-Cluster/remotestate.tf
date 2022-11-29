terraform {
  backend "s3" {
    bucket = "myzone-terraform-aws"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform_eks_cluster"
  }
}