locals {
  name = "tf_test"

}

module "tf_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${local.name}-vpc"
  cidr = "20.0.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets     = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]
  public_subnets      = ["20.0.11.0/24", "20.0.12.0/24", "20.0.13.0/24"]

  # Database 
  database_subnets    = ["20.0.21.0/24", "20.0.22.0/24", "20.0.23.0/24"]
  
  #database subnet group
  create_database_subnet_group =  true
  create_database_subnet_route_table = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # For Outbound connection 
  enable_nat_gateway = false

  public_subnet_tags = {
    "Type" = "${local.name}-vpc-public"
  } 

  private_subnet_tags = {
    "Type" = "${local.name}-vpc-private"
  }

  database_subnet_tags = {
    "Type" = "${local.name}-database-subnet"
  }

  tags = {
    "type" = local.name
    "CreatedBy" = "Dhanwan Prajapati"
  }


}