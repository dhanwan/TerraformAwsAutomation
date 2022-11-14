variable "eks_version" {
    description =  "Specifing version for kubernets cluster"
    default = null
  
}

variable "cluster_service_ipv4_cidr" {
    description = "Cidr value for ipv4 "
    type = string
    default = null
    
}

variable "cluster_enpoint_public_access" {
    type = bool
    default = true
  
}

variable "cluster_enpoint_private_access" {
    type = bool
    default =  false 
  
}
variable "public_access_cidrs" {
    type = list
    default = null
  
}