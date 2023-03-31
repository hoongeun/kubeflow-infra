resource "aws_lb" "internal_nlb" {
  name               = "${var.name}-int-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = data.aws_subnets.private.ids

  enable_deletion_protection = true

  tags = merge(local.tags, var.tags, {
    Name = "${var.name}-int-nlb"
  })
}
