output "ec2_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.nginx_instance[*].public_ip
}
