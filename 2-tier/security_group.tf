resource "aws_security_group" "terraform-sg1" {
    name = "teraaform-sg1"
    description = "Allow web and ssh traffic to EC2 instance"
    vpc_id = data.aws_vpc.main.id

   ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [ aws_security_group.allow_http.id ]

   }

   ingress {
    description  = "ssh from VPC"
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
      "Name" = "${local.env}-sg1"

    }
}



# resource "aws_security_group_rule" "add-terraform-rule" {
#       type = "ingress"
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       security_group_id = aws_security_group.terraform-sg1.id 

# }