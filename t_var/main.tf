resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
    count = var.instance_count

    tags = {
      "Name" = "web"
    }

  
}