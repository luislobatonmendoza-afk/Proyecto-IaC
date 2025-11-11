resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Este SG debe permitir SSH para que Ansible pueda conectarse a todas las instancias (Proxy, Frontends, Database)
resource "aws_security_group" "proxy_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Se usa tu IP confirmada
    cidr_blocks = ["179.7.16.124/32"] 
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # El rango de la VPC es 10.0.0.0/16
    cidr_blocks = ["10.0.0.0/16"] 
  }

  # Regla existente para HTTP (acceso web al proxy)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla existente para HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla de salida (egress): permitir todo el tráfico saliente
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# SG para Monitoreo
resource "aws_security_group" "monitoring_sg" {
  vpc_id = aws_vpc.main.id

  # Acceso a Grafana desde tu IP (Puerto 3000)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["179.7.16.124/32"]
  }

  # Acceso a Prometheus desde la IP (Puerto 9090)
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["179.7.16.124/32"]
  }

  # PERMITE SSH DESDE LA VPC (Para CloudShell/Ansible)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] 
  }

  # Regla de salida: permitir todo el tráfico saliente
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

