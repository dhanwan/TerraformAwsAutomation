variable "azs" {
    type = list
    default = [ "ap-south-1a", "ap-south-1b", "ap-south-1c"]
  
}

variable "region" {
    default = "us-east-1"
  
}

variable "instance_type" {
    default = "t3.micro"
  
}