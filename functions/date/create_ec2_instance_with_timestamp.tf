provider "aws" {
  region = "ap-south-1"
}
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "timestamp" {
  value = local.time
}
