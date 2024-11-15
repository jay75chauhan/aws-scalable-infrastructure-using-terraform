resource "aws_db_instance" "postgres" {
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.db_instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  multi_az               = var.multi_az
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.security_group]

  db_subnet_group_name = var.db_subnet_group_name  
  publicly_accessible    = var.db_public_access
}
