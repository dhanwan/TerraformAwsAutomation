output "public_subnets" {
    value = module.vpc.public_subnets
  
}

output "ALB-DNS" {
    value = aws_lb.ecs-alb.dns_name
  
}