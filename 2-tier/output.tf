

output "EC2_DNS" {
    value = aws_instance.web.public_dns
  
}

output "ALB_DNS" {
    value = aws_lb.web.dns_name
  
}

output "RDS_DNS" {
    value = aws_db_instance.alb-web-db.address
  
}