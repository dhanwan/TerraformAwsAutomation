output "azs" {
    value = module.vpc_dev.azs
  
}

output "db-subnets" {
    value = module.vpc_dev.database_subnets_cidr_blocks
  
}

output "private_cidr" {
  value = module.vpc_dev.private_subnets_cidr_blocks
}

output "public_cidr" {
    value = module.vpc_dev.public_subnets_cidr_blocks
  
}

output "vpc" {
    value = module.vpc_dev.vpc_id
  
}

output "vpc_cidr" {
    value = module.vpc_dev.vpc_cidr_block
  
}

output "public_subnets_ids" {
    value = module.vpc_dev.public_subnets
  
}

output "private_subntes_ids" {
    value = module.vpc_dev.private_subnets
  
}