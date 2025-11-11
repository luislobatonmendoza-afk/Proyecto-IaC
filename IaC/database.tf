resource "aws_instance" "database" {
  ami           = "ami-0c398cb65a93047f2"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name = "smartretail-iac-key"
  tags = {
    Name = "database"
  }
}
