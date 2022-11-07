data "aws_availability_zones" "azs" {
    filter {
        name   = "opt-in-status"
        values = ["opt-in-not-required"]
  }
  
}

output "azs" {
    value = data.aws_availability_zones.azs.names
  
}