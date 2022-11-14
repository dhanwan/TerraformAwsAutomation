module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.0"

  name        = "${local.name}-sg"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc_dev.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp"]

  # Egress rules
  egress_rules = ["all-all"]

  tags = local.common_tags
}