resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "12.3"
  instance_class         = "db.t3.micro"
  name                   = "mydb"
  username               = var.rds_username
  password               = var.rds_password
  publicly_accessible    = false
  vpc_security_group_ids = [var.rds_security_group]
  db_subnet_group_name   = var.private_subnet_id
}
