resource "aws_lb" "external_alb" {
  name               = "${var.name}-ext-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnets.public.ids

  enable_deletion_protection = true

  tags = merge(local.tags, var.tags, {
    Name = "${var.name}-ext-alb"
  })
}
