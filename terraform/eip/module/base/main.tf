resource "aws_eip" "ip" {
  vpc = true

  tags = {
    Name = var.name
  }
}
