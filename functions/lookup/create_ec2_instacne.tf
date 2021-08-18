provider "aws" {
  region = var.region
}

resource "aws_key_pair" "my_key" {
  key_name   = "login-key"
  public_key = file("${path.module}/madhu.pub")
}
resource "aws_instance" "stagging" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  count         = 2
  tags = {
    Name = element(var.tags, count.index)
  }
}
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}
output "timestamp" {
  value = local.time
}
