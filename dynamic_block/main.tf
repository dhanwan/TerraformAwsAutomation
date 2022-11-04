resource "aws_instance" "web" {
    ami = data.aws_ami.ami.id
    instance_type = var.instance_type
    subnet_id = data.aws_subnets.public_subnet.ids[0]
    key_name = var.aws_key
    associate_public_ip_address = true 
    security_groups = [ aws_security_group.web_sg.id ]
  
}

resource "aws_security_group" "web_sg" {
    name = "T_web_sg1"
    description = "allow http and tls and ssh"
    vpc_id = data.aws_vpc.main.id

    dynamic "ingress" {
        for_each = var.ports
        content {
            description = "allow ports"
            protocol = "tcp"
            to_port = ingress.value
            from_port = ingress.value
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
  
}