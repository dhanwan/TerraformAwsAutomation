resource "aws_security_group" "web" {
    description = "Allow ssh"
    vpc_id = data.aws_vpc.main.id
    name = "terraform_sg1"
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
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
  
}

resource "aws_instance" "web" {
    ami = data.aws_ami.ami.id
    subnet_id = data.aws_subnets.public.ids[0]
    instance_type = var.instance_type
    key_name = var.aws_key
    associate_public_ip_address = true 
    security_groups = [ aws_security_group.web.id ]

    provisioner "file" {
        source = "~/Dhanwan/test/test.txt"
        destination = "/home/ubuntu/"

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = file("~/Dhanwan/AWS/Devops.pem")
      target_platform = "4m"
    }
      
    }
  
}