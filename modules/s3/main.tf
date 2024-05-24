# S3 Bucket
resource "tls_private_key" "EC2-Key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "aws_key_pair" "deployer" {
  key_name   = "EC2-Key"
  public_key = tls_private_key.EC2-Key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.EC2-Key.private_key_pem
  filename = "${path.module}/EC2-Key.pem"
}


resource "aws_s3_bucket" "bucket-for-pem" {
  bucket = "bucker-for-pem"
  key    = "./terraform.tfstate"

  tags = {
    Name = "bucker-for-pem"
  }
}

resource "aws_s3_object" "private_key" {
  bucket = "bucker-for-pem"
  key    = "EC2-Key.pem"
  source = local_file.private_key_pem.filename
  acl    = "private"
}

