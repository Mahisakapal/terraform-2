provider "aws" {
  region = "ap-south-1"
}


resource "aws_security_group" "my_sec_cred" {
  name        = "allow_ssh_conn"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP into VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myec2" {
  ami                    = "ami-011c99152163a87ae"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_sec_cred.id]
}
