variable "instance_type" {
  
  description = "Aws Ec2 Instance type"
  type =  string
  default = "t2.micro"
}

variable "ami" {
  type = string
  default = "ami-01216e7612243e0ef"
}

variable "instance_count" {
    type = number
    default = 1
  
}