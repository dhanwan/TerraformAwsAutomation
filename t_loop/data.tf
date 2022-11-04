data "aws_vpc" "main" {
    filter {
      name = "tag:Name"
      values = [ "dev-vpc" ]
    }
  
}

data "aws_subnets" "public" {
    filter {
      name = "vpc-id"
      values = [ data.aws_vpc.main.id ]
    }
    tags = {
      "Name" = "dev-subnet-public*"
    }


}

data "aws_ami" "ami" {
    most_recent = true 
    owners = ["amazon"]
    filter {
      name = "name"
      values = [ "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" ]

    }
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
  
}