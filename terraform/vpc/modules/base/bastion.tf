locals {
  bastion_tags = {}
}

resource "aws_instance" "bastion" {
  count         = var.enable_bastion ? 1 : 0
  ami           = data.aws_ami.ubuntu_ami
  instance_type = "t2.nano"
  subnet_id     = aws_subnet.public_public[0].id
  key_name      = var.bastion_keypair
  vpc_security_group_ids = [
    aws_security_group.bastion_sg[count.index].id
  ]

  tags = merge(local.tags, local.bastion_tags, {
    Name = "${var.name}-bastion"
  }, var.tags)
}

resource "aws_security_group" "bastion_sg" {
  count  = var.enable_bastion ? 1 : 0
  name   = "eks-bastion"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = var.bastion_ingress
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, local.bastion_tags, {
    Name = "${var.name}-bastion"
  }, var.tags)
}
