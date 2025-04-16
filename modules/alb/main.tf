resource "aws_lb" "demo_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demo_sg.id]
  subnets            = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
 
  tags = {
    Name = "demo-alb"
  }
}
 
resource "aws_lb_target_group" "demo_tg" {
  name     = "demo-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id
 
  health_check {
    interval            = 30
    path                = "/login"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }
 
  tags = {
    Name = "demo-tg"
  }
}
 
resource "aws_lb_listener" "demo_listener" {
  load_balancer_arn = aws_lb.demo_alb.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo_tg.arn
  }
}
 
resource "aws_lb_target_group_attachment" "demo_tg_attachment" {
  target_group_arn = aws_lb_target_group.demo_tg.arn
  target_id        = aws_instance.demo_instance.id
  port             = 8080
}
