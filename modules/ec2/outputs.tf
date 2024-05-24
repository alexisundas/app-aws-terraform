output "instances" {
  value = aws_instance.web.*.id
}

output "SERVER_PUBLIC_IP" {
  value = aws_instance.web.*.public_ip
}

output "SERVER_PRIVATE_IP" {
  value = aws_instance.web.*.private_ip
}