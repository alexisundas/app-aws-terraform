variable "DOCKERHUB_TOKEN" {
  description = "Docker Hub Token for authentication"
  type = string
  sensitive = true
}

variable "DOCKERHUB_USERNAME" {
  description = "Docker Hub Username for authentication"
  type = string
}

variable "aws_region" {
  type = string
  default = "eu-central-1"
}


