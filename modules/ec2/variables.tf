variable "ami" {
  description = "AMI ID"
}

variable "instance_type" {
  description = "Instance type"
}

variable "subnet_ids" {
  description = "Subnet IDs"
}

variable "subnets" {
  description = "Subnets for EC2"
  type = list(string)
}

variable "security_group" {
  description = "Security group ID"
}

variable "ec2_names" {
  description = "EC2 names"
  type = list(string)
  default = ["WebServer1", "WebServer2"]
}
