resource "aws_security_group" "rds-sg2" {
    name = "rds-sg2"
    description = "Allow Rds IN our vpc"
    vpc_id = data.aws_vpc.main.id

   ingress {
    description      = "MySql from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}