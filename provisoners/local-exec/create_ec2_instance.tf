provider "aws" {
  region = "ap-south-1"

}
resource "aws_instance" "myec" {
  ami           = "ami-011c99152163a87ae"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket         = "jmsth29-terrafromstate"
    key            = "jmsth29.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "jmsth29_terraform"
  }
}
