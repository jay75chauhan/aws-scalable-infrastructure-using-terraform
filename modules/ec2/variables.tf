variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instances will be deployed"
  type        = string
}

variable "ec2_security_group" {
  description = "Security group ID for EC2 instances"
  type        = string
}
