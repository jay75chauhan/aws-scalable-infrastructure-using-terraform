resource "aws_vpc" "custom" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "custom_vpc" }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.custom.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags                    = { Name = "public_subnet" }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = var.private_subnet_cidr
  tags       = { Name = "private_subnet" }
}
