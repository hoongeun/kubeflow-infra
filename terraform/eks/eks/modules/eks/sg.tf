resource "aws_security_group" "cluster" {
  name        = "${var.name}-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, var.tags, {
    Name = "${var.name}-cluster"
  }, var.tags)
}
