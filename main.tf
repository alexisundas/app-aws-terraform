module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}


module "web" {
  source         = "./modules/ec2"
  ami            = "ami-08188dffd130a1ac2" # Replace with your preferred Linux AMI
  instance_type  = "t2.medium"
  security_group = module.security_groups.web_sg_id
  subnet_ids     = module.vpc.subnet_ids
  subnets        = module.vpc.subnet_ids
  ip_address     = module.web.public_ip
}


variable "ip_address" {}
