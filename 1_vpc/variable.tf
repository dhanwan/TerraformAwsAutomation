variable "availability_zone" {
    description = "List of azs "
    type = list(string)
    default = [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ]   
  
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
  
}

variable "public_subnets_cidr" {
  description = "List of public subnets cidr block"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}

variable "private_subnets_cidr" {
    description = "List of private subnets cidr blocks"
    type = list(string)
    default = [ "10.0.11.0/24", "10.0.12.0/24" ,"10.0.13.0/24"]
  
}

variable "db_subnets" {
    description = "list of db subnets"
    type = list(string)
    default = [ "10.0.101.0/24","10.0.102.0/24", "10.0.103.0/24"]
  
}

variable "owner" {
    default = "Dhanwan"
  
}

variable "projet_name" {
    default = "myzone"
  
}