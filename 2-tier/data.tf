data "aws_vpc" "main" {
    filter {
        name = "tag:Name"
        values = ["dev-vpc"]
    }
  
}

data "aws_subnet" "public_subnet-1" {
    vpc_id = data.aws_vpc.main.id
    filter {
      name = "tag:Name"
      values = ["dev-subnet-public1-ap-south-1a"]
    }
  
}

data "aws_subnet" "public_subnet-2" {
    vpc_id = data.aws_vpc.main.id
    filter {
      name = "tag:Name"
      values = ["dev-subnet-public2-ap-south-1b"]
    }
  
}

data "aws_subnet" "private1" {
    vpc_id = data.aws_vpc.main.id
    filter {
      name = "tag:Name"
      values = ["dev-subnet-private1-ap-south-1a"]
    }
  
}

data "aws_subnet" "private2" {
    vpc_id = data.aws_vpc.main.id
    filter {
      name = "tag:Name"
      values = ["dev-subnet-private2-ap-south-1b"]
    }
  
}