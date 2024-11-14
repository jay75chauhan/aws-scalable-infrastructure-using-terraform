use_default_vpc      = false
vpc_cidr_block       = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
key_name             = "your-ec2-keypair"
instance_type        = "t3.micro"
instance_count       = 3
ami_id               = "ami-0c55b159cbfafe1f0"
user_data_script     = <<EOF
#!/bin/bash
apt-get update -y
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
EOF
s3_bucket_prefix     = "app-bucket"
s3_bucket_count      = 3
db_name              = "appdb"
db_username          = "appuser"
db_password          = "securepassword"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_backup_retention  = 7
multi_az             = false
rds_engine_version   = "13.3"
db_public_access     = false
