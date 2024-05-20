terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source   = "./modules/security-groups"
  vpc_id   = module.vpc.vpc_id
}

# RSA key of size 4096 bits
resource "tls_private_key" "private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "jenkins" {
  source         = "./modules/ec2"
  ami            = "ami-08188dffd130a1ac2"  # Replace with your preferred Linux AMI
  instance_type  = "t2.medium"
  subnet_id      = module.vpc.public_subnet_id
  security_group = module.security_groups.web_sg_id
  instance_name  = "JenkinsServer"
}



