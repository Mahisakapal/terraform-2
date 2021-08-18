provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "myec2" {
  ami           = "ami-011c99152163a87ae"
  instance_type = "t2.medium"
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

  }
}
