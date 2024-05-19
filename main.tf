provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source   = "./modules/security-groups"
  vpc_id   = module.vpc.vpc_id
}

module "jenkins" {
  source         = "./modules/ec2"
  ami            = "ami-0c55b159cbfafe1f0"  # Replace with your preferred Linux AMI
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.public_subnet_id
  security_group = module.security_groups.web_sg_id
  instance_name  = "JenkinsServer"
  private_key_path = var.private_key_path
}


module "web_app" {
  source         = "./modules/ec2"
  ami            = "ami-0c55b159cbfafe1f0"  # Replace with your preferred Linux AMI
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.public_subnet_id
  security_group = module.security_groups.web_sg_id
  instance_name  = "WebAppInstance"
}

module "backend" {
  source         = "./modules/ec2"
  ami            = "ami-0c55b159cbfafe1f0"  # Replace with your preferred Linux AMI
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.private_subnet_id
  security_group = module.security_groups.backend_sg_id
  instance_name  = "BackendInstance"
}

output "jenkins_public_ip" {
  value = module.jenkins.public_ip
}

output "web_app_public_ip" {
  value = module.web_app.public_ip
}

output "backend_private_ip" {
  value = module.backend.private_ip
}
