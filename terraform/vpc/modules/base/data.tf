data "aws_availability_zone" "az" {
  count = length(var.azs)
  name  = "${var.region}${var.azs[count.index]}"
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_eip" "eip" {
  count = length(var.azs)
  tags = {
    Name = "dev-kubeflow-nat-${var.azs[count.index]}"
  }
}
