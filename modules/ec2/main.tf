resource "aws_instance" "web" {
  count                  = length(var.ec2_names)
  ami                    = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.security_group]
  subnet_id              = var.subnets[count.index]
  tags = {
    Name = var.ec2_names[count.index]
  }
}

/*  provisioner "remote-exec" {
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
      private_key = file("~/.ssh/id_rsa.pem")
      host        = self.public_ip
    }
  }
}
*/

