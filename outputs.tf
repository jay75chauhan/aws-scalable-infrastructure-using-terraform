output "ec2_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = module.ec2.instance_public_ips
}

output "s3_bucket_names" {
  description = "Names of S3 buckets"
  value       = module.s3.bucket_names
}

output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.rds.endpoint
}
