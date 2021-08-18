variable "no-of-instances" {
  default = 1
}
variable "region" {
  description = "AWS region for hosting our your network"
  default     = "ap-south-1"
}
variable "amiid" {
  description = "Base ami to launch the instances"
  default     = "ami-011c99152163a87ae"
}
