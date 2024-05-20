output "public_ip_ec2" {
  value = aws_instance.web.public_ip
}

output "private_ip_ec2" {
  value = aws_instance.web.private_ip
}
