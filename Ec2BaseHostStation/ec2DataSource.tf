data "aws_ami" "ami" {
    most_recent = true 
    owners = [ "amazon" ]

    filter {
      name = "name"
      values = ["amzn-ami-hvm-*-gp2"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
  
}

output "name" {
    value = data.aws_ami.ami.id
  
}