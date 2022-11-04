resource "aws_db_subnet_group" "web-db-subnet-group" {
    name = "web-db-subnet-group"
    description = "web alb subnet group"
    subnet_ids = [ data.aws_subnet.private1.id, data.aws_subnet.private2.id ]
  
}