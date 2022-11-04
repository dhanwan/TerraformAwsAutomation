output "public" {
    value = data.aws_subnets.public.ids
  
}

output "ami" {
    value = data.aws_ami.ami.id
  
}