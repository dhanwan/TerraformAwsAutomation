resource "aws_db_instance" "alb-web-db" {
    allocated_storage = 10
    engine = var.db_engine_name
    engine_version = var.db_engine_version
    instance_class = var.db_instance_class
    db_name = var.db_name
    username = var.db_username
    password = var.db_password
    skip_final_snapshot = true
    delete_automated_backups = true
    db_subnet_group_name = aws_db_subnet_group.web-db-subnet-group.id
    vpc_security_group_ids = [aws_security_group.rds-sg2.id]
    
tags = {
  "Name" = "${local.env}-rds"
}
  
}
