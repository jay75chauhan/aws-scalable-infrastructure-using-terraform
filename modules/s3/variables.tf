variable "s3_bucket_prefix" {
  description = "Prefix for S3 bucket names"
  type        = string
  default     = "app-bucket"
}

variable "s3_bucket_count" {
  description = "Number of S3 buckets to create"
  type        = number
  default     = 3
}
