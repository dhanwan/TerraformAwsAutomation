# resource "null_resource" "copy_ec2_key" {
#     depends_on = [module.ec2-instance]

#     connection {
#       host = aws_eip.ec2_ip.public_ip
#       type = "ssh"
#       user = var.ec2_user
#       password = ""
#       private_key = file("privateKey/terraform.pem")

#     }

#     # File provisioner
#     provisioner "file" {
#       source = "privateKey/terraform.pem"
#       destination = "/tmp/terraform.pem"
#     }

#     # Remote Provisioner

#     provisioner "remote-exec" {
#       inline = [
#         "sudo chmod 400 /tmp/terraform.pem"
#       ]
      
#     }
    
  
# }