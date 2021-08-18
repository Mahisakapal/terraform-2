variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0947d2ba12ee1ff75"
    "ap-south-1" = "ami-0e306788ff2473ccb"
  }
}
variable "region" {
  default = "ap-south-1"
}
variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}
