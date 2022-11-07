data "aws_availability_zones" "azs" {

    filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
  
}

data "aws_ec2_instance_type_offerings" "my_inst_type1" {
  for_each = toset(data.aws_availability_zones.azs.names)
  filter {
    name   = "instance-type"
    values = [var.instance_type]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}