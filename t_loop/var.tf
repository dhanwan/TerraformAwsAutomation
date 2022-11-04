variable "aws_user" {
    type = list(string)
    default = [ "user1", "user2", "user3" ]
  
}

variable "instance_type" {
    type = list(string)
    default = ["t2.micro", "t2.small", "t2.medium"]
  
}

variable "aws_key" {
    default = "DevOps"
  
}
