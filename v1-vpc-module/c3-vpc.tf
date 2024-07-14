# Create VPC TERRAFORM MODULE
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name           = "vpc-dev"
  cidr           = "10.0.0.0/16"
  azs            = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]


  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  # Dattabase Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.5.0/24", "10.0.6.0/24"]
  # Nat Gateways for outbound communication
  enable_nat_gateway = true
  single_nat_gateway = false
  #VPC DN parametesrs
  enable_dns_hostnames = true
  enable_dns_support   = true



  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner       = "Otmane"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }



}