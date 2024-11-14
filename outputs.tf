output "ec2_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.ec2_public_ips
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.endpoint
}

output "s3_bucket_names" {
  description = "Names of the S3 buckets"
  value       = module.s3.bucket_names
}
