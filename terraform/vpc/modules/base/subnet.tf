resource "aws_subnet" "private_subnet" {
  count      = length(var.azs)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, index(local.azs, var.azs[count.index]))

  availability_zone = data.aws_availability_zone.az[count.index].name

  tags = merge(local.tags, var.tags, {
    Name = "${var.name}-priv-subnet-${var.azs[count.index]}"
  })
}

resource "aws_nat_gateway" "private_nat" {
  count             = length(var.azs)
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet[count.index].id
}

resource "aws_subnet" "public_public" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 2, 2 + index(local.azs, var.azs[count.index]))
  availability_zone = data.aws_availability_zone.az[count.index].name

  map_public_ip_on_launch = true

  tags = merge(local.tags, var.tags, {
    Name = "${var.name}-pub-subnet-${var.azs[count.index]}"
  })
}

