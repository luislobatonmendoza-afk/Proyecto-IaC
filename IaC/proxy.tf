resource "aws_instance" "proxy" {
  ami           = "ami-0c398cb65a93047f2" # Ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.proxy_sg.id]
  key_name = "smartretail-iac-key"
  tags = {
    Name = "nginx-proxy"
  }
}
