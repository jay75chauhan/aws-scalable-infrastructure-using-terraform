module "vpc" {
  source          = "./vpc"
  use_default_vpc = var.use_default_vpc
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ec2" {
  source          = "./ec2"
  subnet_id       = module.vpc.public_subnet_id
  key_name        = var.key_name
  instance_count  = var.instance_count
  instance_type   = var.instance_type
  ami_id          = var.ami_id
  user_data       = var.user_data_script
}

module "s3" {
  source           = "./s3"
  s3_bucket_prefix = var.s3_bucket_prefix
  s3_bucket_count  = var.s3_bucket_count
}

module "rds" {
  source          = "./rds"
  private_subnets = module.vpc.private_subnet_ids
  db_name         = var.db_name
  db_username     = var.db_username
  db_password     = var.db_password
  db_instance_class = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  multi_az        = var.multi_az
  engine_version  = var.rds_engine_version
  backup_retention = var.db_backup_retention
  db_public_access = var.db_public_access
  security_group  = module.vpc.rds_security_group_id
}
