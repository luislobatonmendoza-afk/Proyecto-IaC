resource "aws_instance" "database" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "database"
  }
}
