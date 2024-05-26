#####################
# terraform State   #
#####################
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.terraform_state_bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }
 }

# Add bucket encryption to hide sensitive state data
resource "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.terraform_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

# resource "aws_s3_bucket_acl" "bucket_acl" {
#   bucket = aws_s3_bucket.terraform_state.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
