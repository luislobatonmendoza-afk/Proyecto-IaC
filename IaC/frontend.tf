resource "aws_instance" "frontend" {
  count         = 2
  ami           = "ami-xxxxxxxx" # Ubuntu
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "frontend-${count.index}"
  }
}
