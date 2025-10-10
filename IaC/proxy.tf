resource "aws_instance" "proxy" {
  ami           = "ami-xxxxxxxx" # Ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.proxy_sg.id]

  tags = {
    Name = "nginx-proxy"
  }
}
