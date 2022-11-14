# Data Sources
data "aws_availability_zones" "azs" {
  # state = "available"
}


# Vpc module
module "vpc_dev" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${local.name}-${local.vpc_name}"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.azs.names
  private_subnets     = var.private_subnets_cidr
  public_subnets      = var.public_subnets_cidr

  # Database 
  database_subnets    = var.db_subnets

  
  #database subnet group
  create_database_subnet_group =  var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table

  enable_dns_hostnames = true
  enable_dns_support   = true

  # For Outbound connection 
  enable_nat_gateway = var. enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  public_subnet_tags = {
    "Type" = "${local.name}-public"
  } 

  private_subnet_tags = {
    "Type" = "${local.name}-private"
  }

  database_subnet_tags = {
    "Type" = "${local.name}-db"
  }

  tags = local.common_tags


}