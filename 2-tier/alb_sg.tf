resource "aws_security_group" "allow_http" {
    name = "web_alb_sg1"
    description = "Allow port 80 for handling tarffic"
    vpc_id = data.aws_vpc.main.id
    
   ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  
  tags = {
    "Name" = "${local.env}-alb-sg1"
  }
}