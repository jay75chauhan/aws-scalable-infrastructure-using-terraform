output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.custom_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

output "ec2_security_group" {
  description = "Security group for EC2 instances"
  value       = aws_security_group.ec2_sg.id
}

output "rds_security_group" {
  description = "Security group for RDS instance"
  value       = aws_security_group.rds_sg.id
}
