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

variable "DOCKERHUB_USERNAME" {
  description = "Docker Hub username"
}

variable "DOCKERHUB_TOKEN" {
  description = "Docker image tag"
}

variable "private_key_path" {
    type = string
    default = "/Home/Users/Alexis/.ssh/testing.pem"
}