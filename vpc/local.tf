locals {
  owner = var.owner
  env = var.environment
  name = "${var.projet_name}-${var.environment}"
  common_tags = {
    CreatedBy = var.owner
    Type = var.environment
    CreationDate = timestamp()
  }


}
