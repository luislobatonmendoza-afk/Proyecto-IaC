terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# Incluimos los demás archivos
module "network" {
  source = "./network.tf"
}

module "proxy" {
  source = "./proxy.tf"
}

module "frontend" {
  source = "./frontend.tf"
}

module "database" {
  source = "./database.tf"
}

module "grafana" {
  source = "./grafana.tf"
}
