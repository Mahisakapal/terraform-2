provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "ami-011c99152163a87ae"
  instance_type = var.type["ap-south-1"]
  key_name      = "jmsth307"
}
