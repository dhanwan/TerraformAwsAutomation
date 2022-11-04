

resource "aws_instance" "web" {
    ami = var.ami
    instance_type = local.instance_type
    key_name = aws_key_pair.web.key_name
    subnet_id = data.aws_subnet.public_subnet-1.id
    vpc_security_group_ids = [aws_security_group.terraform-sg1.id]
    associate_public_ip_address = true

    tags = {
      "Name" = "${local.env}-ec2",
      "Type" =  "test"
    }
# Ansible
    provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook playbook.yml" 
}


}

  
# Key pair creation


resource "aws_key_pair" "web" {
  key_name = "web"
  public_key = file(var.key_path)
     tags = {
      "Name" = "${local.env}-ec2",
      "Type" =  "test"
    }
}



# Ansible 

  
