output "s3_bucket_name" {
  value = aws_s3_bucket.bucket-for-pem.bucket
}

output "private_key" {
  value = aws_s3_object.private_key.source
}