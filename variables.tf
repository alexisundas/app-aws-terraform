variable "aws_access_key_id" {
  type        = string
  sensitive   = true
}
variable "aws_secret_access_key" {
  type        = string
  sensitive   = true
}
variable "private_key_path" {
  type        = string
  sensitive   = true
  description = "Path to the private key file for SSH access"
}