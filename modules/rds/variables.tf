variable "rds_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "rds_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "rds_security_group" {
  description = "Security group ID for the RDS instance"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet for the RDS instance"
  type        = string
}
