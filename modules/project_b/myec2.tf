provider "aws" {
  region = "ap-south-1"
}

module "ec2_my" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  name           = "my-cluster"
  instance_count = 1
  ami            = "ami-00bf4ae5a7909786c"
  instance_type  = "t2.micro"
  subnet_id      = "subnet-e60de78d"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
