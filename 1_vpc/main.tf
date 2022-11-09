
module "tf_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${local.name}-vpc"
  cidr = var.vpc_cidr

  azs = var.availability_zone
  private_subnets     = var.private_subnets_cidr
  public_subnets      = var.public_subnets_cidr

  # Database 
  database_subnets    = var.db_subnets
  
  #database subnet group
  create_database_subnet_group =  true
  create_database_subnet_route_table = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # For Outbound connection 
  enable_nat_gateway = false

  public_subnet_tags = {
    "Type" = "${local.name}-subnet-public"
  } 

  private_subnet_tags = {
    "Type" = "${local.name}-subnet-private"
  }

  database_subnet_tags = {
    "Type" = "${local.name}-db-subnet"
  }

  tags = local.common_tags


}