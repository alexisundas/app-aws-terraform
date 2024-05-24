
resource "aws_instance" "web" {
  count                  = length(var.ec2_names)
  ami                    = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.security_group]
  subnet_id              = var.subnets[count.index]
  key_name               = "EC2-Key"
  tags = {
    Name = var.ec2_names[count.index]
  }



  # SHH Connection with EC2
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = var.private_key
    host        = self.public_ip
  }
  # Install Docker
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y docker.io",
      "sudo systemctl start docker",
      "sudo systemctl enable docker"
    ]
  }
}


