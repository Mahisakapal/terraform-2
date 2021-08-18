provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "myec2" {
  ami                    = "ami-00bf4ae5a7909786c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0cd091f31b0ad29e2"]
  key_name               = "jmsth31"
  subnet_id              = "subnet-e60de78d"
  tags = {
    Name = "jenkins"
  }
}
