variable "use_default_vpc" {
  description = "Use the default VPC (true) or create a custom VPC (false)"
  type        = bool
  default     = false
}

variable "vpc_cidr_block" {
  description = "CIDR block for the custom VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.3.0/24"
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 3
}

variable "user_data_script" {
  description = "User data script to configure instances"
  type        = string
  default     = <<EOF
#!/bin/bash
apt-get update -y
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
EOF
}

variable "s3_bucket_prefix" {
  description = "Prefix for S3 bucket names"
  type        = string
  default     = "app-bucket"
}

variable "s3_bucket_count" {
  description = "Number of S3 buckets to create"
  type        = number
  default     = 3
}

variable "db_name" {
  description = "Database name for PostgreSQL"
  type        = string
}

variable "db_username" {
  description = "Database username for PostgreSQL"
  type        = string
}

variable "db_password" {
  description = "Database password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for RDS PostgreSQL"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB for RDS"
  type        = number
  default     = 20
}

variable "db_backup_retention" {
  description = "Backup retention period in days for RDS"
  type        = number
  default     = 7
}

variable "multi_az" {
  description = "Enable multi-AZ deployment for RDS"
  type        = bool
  default     = false
}

variable "rds_engine_version" {
  description = "RDS PostgreSQL engine version"
  type        = string
  default     = "13.3"
}

variable "db_public_access" {
  description = "Whether RDS should be accessible publicly"
  type        = bool
  default     = false
}
