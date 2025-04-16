resource "aws_instance" "demo_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
 
  associate_public_ip_address = true
 
  user_data = file("user_data.sh")
 
  tags = {
    Name = "demo-instance"
  }
}
