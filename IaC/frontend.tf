resource "aws_instance" "frontend" {
  count         = 2
  ami           = "ami-0c398cb65a93047f2" # Ubuntu
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name = "smartretail-iac-key"
  tags = {
    Name = "frontend-${count.index}"
  }
}
