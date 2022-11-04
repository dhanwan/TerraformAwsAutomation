resource "aws_lb" "web" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets = [ data.aws_subnet.public_subnet-1.id,data.aws_subnet.public_subnet-2.id ]
  enable_deletion_protection = false


  tags = {
    type = "${local.env}-alb"
  }
}


resource "aws_alb_target_group" "tg1" {
    name = "terraform-web-tg1"
    port = 80
    protocol = "HTTP"
    vpc_id = data.aws_vpc.main.id

    tags = {
      "Name" = "${local.env}-web-tg1"
    }
  
}

resource "aws_lb_target_group_attachment" "alb-web-attach" {
    target_group_arn = aws_alb_target_group.tg1.arn
    target_id = aws_instance.web.id
    port = 80
  
}

resource "aws_lb_listener" "web-alb-listener" {
    load_balancer_arn = aws_lb.web.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_alb_target_group.tg1.arn
    }
  
}