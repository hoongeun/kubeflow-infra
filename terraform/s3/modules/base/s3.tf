resource "aws_s3_bucket" "bucket" {
  bucket = var.name

  object_lock_enabled = true
}

resource "aws_s3_bucket_object_lock_configuration" "object_lock_configuration" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle_configuration" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    id = "rule-1"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

    status = "Enabled"
  }
}
