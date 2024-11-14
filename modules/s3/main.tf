resource "aws_s3_bucket" "app_bucket" {
  count   = var.s3_bucket_count
  bucket  = "${var.s3_bucket_prefix}-${count.index}"
  tags    = { Name = "app_bucket_${count.index}" }
}
