variable "ami" {
  description = "AMI ID"
}

variable "instance_type" {
  description = "Instance type"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_group" {
  description = "Security group ID"
}

variable "instance_name" {
  description = "Name tag for the instance"
}

variable "private_key_path" {
  description = "Path to the private key file for SSH access"
}
