output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "backend_sg_id" {
  value = aws_security_group.backend_sg.id
}
