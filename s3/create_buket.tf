provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "jmsth29-bucket"
  acl    = "public-read"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "Policy1605807205428",
  "Statement": [
      {
          "Sid": "Stmt1605807203343",
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::jmsth29-bucket/*"
      }
  ]
}
EOF
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "test" {
  for_each     = fileset("${path.module}/files", "**")
  bucket       = aws_s3_bucket.bucket.bucket
  content_type = "text/html"
  key          = each.value
  source       = "${path.module}/files/${each.value}"
}

output "mywebsite" {
  value = aws_s3_bucket.bucket.website_endpoint
}
