terraform {
  backend "s3" {
    bucket = "myzone-terraform-state"
    key = "terraform.tfstate"
    encrypt = true
    region = "ap-south-1"

    
  }
}