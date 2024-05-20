module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source   = "./modules/security-groups"
  vpc_id   = module.vpc.vpc_id
}


module "web" {
  source = "./modules/ec2"
  ami            = "ami-08188dffd130a1ac2"  # Replace with your preferred Linux AMI
  instance_type  = "t2.medium"
  subnet_id      = module.vpc.public_subnet_id
  security_group = module.security_groups.web_sg_id
  instance_name  = "Nginx"
  DOCKERHUB_TOKEN = var.DOCKERHUB_TOKEN
  DOCKERHUB_USERNAME = var.DOCKERHUB_USERNAME
}


