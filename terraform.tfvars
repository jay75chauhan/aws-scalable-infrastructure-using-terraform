# VPC Configuration
use_default_vpc      = false
vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"

# EC2 Instance Configuration
instance_type        = "t3.micro"
instance_count       = 3
ami_id               = "ami-0dee22c13ea7a9a67"

# S3 Bucket Configuration
s3_bucket_prefix     = "app-bucket-34534"
s3_bucket_count      = 3

# Database Configuration
db_name              = "appdbjay"
db_username          = "appuserjay"
db_password          = "securepasswordjay"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_backup_retention  = 7
multi_az             = false
rds_engine_version   = "16.3"
db_public_access     = false
