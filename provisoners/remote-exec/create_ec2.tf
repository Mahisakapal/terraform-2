provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "remote_ec2" {
  ami           = "ami-00bf4ae5a7909786c"
  instance_type = "t2.micro"
  key_name      = "jmsth31"

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./jmsth31.pem")
      host        = self.public_ip
    }
  }
}
