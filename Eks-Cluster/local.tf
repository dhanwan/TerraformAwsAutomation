locals {
  owner = var.owner
  env = var.environment
  name = "${var.projet_name}-${var.environment}"
  vpc_name = var.vpc_name
  common_tags = {
    CreatedBy = var.owner
    Type = var.environment
    CreationDate = timestamp()
  }


}
