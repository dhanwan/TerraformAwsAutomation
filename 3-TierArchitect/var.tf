variable "instance_type" {
  
  description = "Aws Ec2 Instance type"
  type =  string
  default = "t2.micro"
}

variable "ami" {
  type = string
  default = "ami-024c319d5d14b463e"
}

variable "instance_count" {
    type = number
    default = 1
  
}

variable "db_engine_name" {
  default = "mariadb"
  
}


variable "key_path" {
    type = string
    default = "~/.ssh/id_rsa.pub"
  
}

variable "db_engine_version" {
  default = "10.6"
  
}

variable "db_username" {
  default = "admin"
  sensitive = true
  
}

variable "db_password" {
  default = "ntf12345"
  sensitive = true
  
}

variable "db_instance_class" {
  default = "db.t3.micro"
  
}

variable "db_name" {
  default = "terraform"
  
}