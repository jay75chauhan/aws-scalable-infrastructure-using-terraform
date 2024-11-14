resource "aws_s3_bucket" "bucket" {
  count  = 3
  bucket = "${var.s3_bucket_prefix}-${count.index}-${random_id.bucket_id.hex}"
}
