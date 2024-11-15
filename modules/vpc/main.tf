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
  availability_zone       = var.availability_zone
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "custom_vpc_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = var.private_subnet_cidr
  tags       = { Name = "private_subnet" }
  availability_zone      = var.availability_zone
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = var.private_subnet_cidr_1
  tags       = { Name = "private_subnet_1" }
  availability_zone      = var.availability_zone_1
}


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private.id, aws_subnet.private_1.id]  
   
  tags = {
    Name = "rds_subnet_group"
  }
}
# Security Group for EC2 Instances
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow HTTP, HTTPS, and SSH access to EC2 instances"

  vpc_id = aws_vpc.custom.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_security_group"
  }
}

# Security Group for RDS Instance
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow EC2 instances to access RDS instance on port 5432"

  vpc_id = aws_vpc.custom.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_security_group"
  }
}