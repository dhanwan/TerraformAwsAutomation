module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.16.1"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  public_subnets = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    type = "public-subnet"

  }

  private_subnet_tags = {
    type = "private-subnet"

  }

  vpc_tags = {
    Name = var.vpc_name
  }
  tags = {
    "app" = "nodejs",
    "env" = "dev"
  }
}


# Security Group for Alb

resource "aws_security_group" "ecs-alb-sg1" {
    name = "ecs-alb-sg1"
    description = "Allow http and https traffic for alb"
    vpc_id = module.vpc.vpc_id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = {
    "app" = "nodejs",
    "env" = "dev"
  }

}
# ALb Creation

resource "aws_lb" "ecs-alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecs-alb-sg1.id]
  subnets            = [ for subnetid in module.vpc.public_subnets : subnetid]


   tags = {

        "app" = "nodejs",
        "env" = "dev"
  }
    
}

# Target Group

resource "aws_lb_target_group" "ecs-alb-tg01" {
  name        = "ecs-alb-tg01"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id

   tags = {

        "app" = "nodejs",
        "env" = "dev"
  }
}


resource "aws_lb_listener" "ecs-alb-listener" {
    load_balancer_arn = aws_lb.ecs-alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.ecs-alb-tg01.arn     
    }
  
}

# Cluster Creation 
resource "aws_ecs_cluster" "ecs-cluster" {
  name = "nodejs-ecs-cluster"

  
   tags = {

        "app" = "nodejs",
        "env" = "dev"
  }
}

# Task Defination creation

# resource "aws_ecs_task_definition" "nodejsTD1" {

  
# }