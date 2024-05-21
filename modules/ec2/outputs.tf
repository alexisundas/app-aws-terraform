output "instances" {
  value = aws_instance.web.*.id
}

output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "private_key_content" {
  value = aws_key_pair.deployer.key_name
}