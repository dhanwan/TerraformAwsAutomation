# resource "aws_iam_user" "iam" {
#   count = length(var.aws_user)
#   name = var.aws_user[count.index]
# }
resource "aws_instance" "web" {
    ami = data.aws_ami.ami.id
    count = 2
    instance_type = var.instance_type[count.index]
    subnet_id = data.aws_subnets.public.ids[count.index]
    key_name = var.aws_key
    associate_public_ip_address =  true 

  
}