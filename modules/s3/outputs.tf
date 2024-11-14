output "bucket_names" {
  description = "Names of the S3 buckets created"
  value = aws_s3_bucket.app_bucket[*].bucket
}
