# Generate a unique random ID for each S3 bucket
resource "random_id" "bucket_id" {
  count = 3
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  count  = 3
  bucket = "${var.s3_bucket_prefix}-${count.index}-${random_id.bucket_id[count.index].hex}"

  tags = {
    Name = "${var.s3_bucket_prefix}-${count.index}"
  }
}
