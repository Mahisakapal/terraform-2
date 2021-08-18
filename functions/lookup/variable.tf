variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0ab4d1e9cf9a1215a"
    "ap-south-1" = "ami-011c99152163a87ae"
  }
}
variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}
