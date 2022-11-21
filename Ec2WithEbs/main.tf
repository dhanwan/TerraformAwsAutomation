resource "aws_instance" "web" {
    ami = data.aws_ami.ami.id
    instance_type = var.instance_type
    key_name = var.aws_key
    subnet_id = data.aws_subnets.public.ids[0]
    associate_public_ip_address = true

  
}

resource "aws_ebs_volume" "web_ebs" {
    availability_zone = var.az1
    size = 5
    type = "gp3"
    tags = {
      "Type" = "web"
    }
  
}

resource "aws_volume_attachment" "web_ebs_attach" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.web_ebs.id
    instance_id = aws_instance.web.id
  
}