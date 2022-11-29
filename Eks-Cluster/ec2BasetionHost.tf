# module "ec2-instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "4.2.1"

#   name = "web"

#   ami                    = data.aws_ami.ami.id
#   instance_type          = var.instance_type
#   key_name               = var.aws_key
# #   monitoring             = true
#   vpc_security_group_ids = [ module.security-group.security_group_id]
#   subnet_id              = module.vpc_dev.public_subnets[0]

#   tags = local.common_tags

# }