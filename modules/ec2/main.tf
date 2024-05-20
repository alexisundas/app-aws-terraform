resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = file("~/.ssh/aws") // Path to your public key
}


resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  key_name = aws_key_pair.ec2-key.key_name

  tags = {
    Name = "web-instance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y docker.io",
      "sudo systemctl start docker",
      "sudo docker login -u ${var.DOCKERHUB_USERNAME} -p ${var.DOCKERHUB_TOKEN}",
      "sudo docker run -d -p 80:80 ${var.DOCKERHUB_USERNAME}/nginx-app:latest"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/aws-private.pem")
      host        = self.public_ip
    }
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

