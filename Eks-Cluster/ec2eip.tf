resource "aws_eip" "ec2_ip" {
    instance   = module.ec2-instance.id
    vpc        = true 
    tags = local.common_tags

    depends_on = [ module.ec2-instance, module.vpc_dev ]

}