provider "aws" {
  region = "ap-south-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

resource "aws_key_pair" "my_key" {
  key_name   = "login-key"
  public_key = file("${path.module}/madhu.pub")
}



resource "aws_instance" "stagging" {
  ami           = "ami-011c99152163a87ae"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name
  count         = 2
  tags = {
    Name = element(var.tags, count.index)
  }

}
