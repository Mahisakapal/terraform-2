provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "myec2" {
  ami           = "ami-00bf4ae5a7909786c"
  instance_type = var.instace_type
}
