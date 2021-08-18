resource "aws_key_pair" "my_key" {
  key_name   = "newkey"
  public_key = file("${path.module}/madhu.pub")
}
