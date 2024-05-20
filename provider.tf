terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.16.1"
        }
    }

    backend "s3" {
        bucket = "terraform-remote-backend-s3"
        key    = "dev/terraform.tfstate"
        region = "eu-central-1"
    }
}

provider "aws" {
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
    token      = var.aws_session_token
    region     = var.aws_region
}