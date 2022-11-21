output "azs" {
    value = module.tf_vpc.azs
  
}

output "db-subnets" {
    value = module.tf_vpc.database_subnets_cidr_blocks
  
}

output "private_cidr" {
  value = module.tf_vpc.private_subnets_cidr_blocks
}

output "public_cidr" {
    value = module.tf_vpc.public_subnets_cidr_blocks
  
}

output "vpc" {
    value = module.tf_vpc.vpc_id
  
}

output "vpc_cidr" {
    value = module.tf_vpc.vpc_cidr_block
  
}

output "public_subnets_ids" {
    value = module.tf_vpc.public_subnets
  
}

output "private_subntes_ids" {
    value = module.tf_vpc.private_subnets
  
}