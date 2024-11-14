variable "private_subnets" {
  description = "List of private subnet IDs for RDS instance"
  type        = list(string)
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

variable "multi_az" {
  description = "Enable multi-AZ deployment for RDS"
  type        = bool
  default     = false
}

variable "engine_version" {
  description = "RDS PostgreSQL engine version"
  type        = string
  default     = "13.3"
}

variable "backup_retention" {
  description = "Backup retention period in days for RDS"
  type        = number
  default     = 7
}

variable "db_public_access" {
  description = "Whether RDS should be accessible publicly"
  type        = bool
  default     = false
}

variable "security_group" {
  description = "Security group ID for RDS access"
  type        = string
}
