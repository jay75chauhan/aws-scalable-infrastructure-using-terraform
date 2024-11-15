variable "use_default_vpc" {
  description = "Use the default VPC (true) or create a custom VPC (false)"
  type        = bool
}

variable "vpc_cidr_block" {
  description = "CIDR block for the custom VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for private subnet"
  type        = string
}


variable "availability_zone" {
  description = "Availability zone for the subnets"
  default     = "ap-south-1a"
}

variable "availability_zone_1" {
  description = "Availability zone for the subnets"
  default     = "ap-south-1b"
}