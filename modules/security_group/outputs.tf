output "web_security_group_id" {
  value = aws_security_group.main.id
}

output "lb_security_group_id" {
  value = aws_security_group.alb_sg.id
}
