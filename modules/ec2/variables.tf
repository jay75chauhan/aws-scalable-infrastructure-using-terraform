variable "subnet_id" {
  description = "Subnet ID where EC2 instances will be launched"
  type        = string
}



variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 3
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

variable "user_data" {
  description = "User data script to configure instances on launch"
  type        = string
}



variable "security_groups" {
  description = "List of security group IDs to associate with EC2 instances"
  type        = list(string)
}

