resource "aws_instance" "grafana" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  tags = {
    Name = "grafana"
  }
}
