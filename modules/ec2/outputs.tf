output "public_ip_jenkins" {
  value = aws_instance.jenkins.public_ip
}

output "private_ip_jenkins" {
  value = aws_instance.jenkins.private_ip
}
