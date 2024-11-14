module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ec2" {
  source             = "./modules/ec2"
  instance_count     = var.ec2_instance_count
  subnet_id          = module.vpc.public_subnet_id
  ec2_security_group = module.vpc.ec2_security_group
}

module "s3" {
  source            = "./modules/s3"
  s3_bucket_prefix  = var.s3_bucket_prefix
}

module "rds" {
  source             = "./modules/rds"
  rds_security_group = module.vpc.rds_security_group
  private_subnet_id  = module.vpc.private_subnet_id
  rds_username       = var.rds_username
  rds_password       = var.rds_password
}
