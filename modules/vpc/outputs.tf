
output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private.id]
}

output "ec2_security_group_id" {
  description = "Security group ID for EC2 instances"
  value       = aws_security_group.ec2_sg.id
}

output "rds_security_group_id" {
  description = "Security group ID for RDS instance"
  value       = aws_security_group.rds_sg.id
}

output "rds_subnet_group_name" {
  description = "The name of the RDS subnet group"
  value       = aws_db_subnet_group.rds_subnet_group.name
}