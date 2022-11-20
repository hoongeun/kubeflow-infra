resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, index(local.azs, "a"))

  tags = merge(local.tags, var.tags, {
    Name = "default-priv-subnet-a"
  })
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, index(local.azs, "c"))

  tags = merge(local.tags, var.tags, {
    Name = "default-priv-subnet-c"
  })
}

resource "aws_subnet" "public_public_a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, 2 + index(local.azs, "a"))

  map_public_ip_on_launch = true

  tags = merge(local.tags, var.tags, {
    Name = "default-pub-subnet-a"
  })
}

resource "aws_subnet" "public_public_c" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 2, 2 + index(local.azs, "c"))

  map_public_ip_on_launch = true

  tags = merge(local.tags, var.tags, {
    Name = "default-pub-subnet-c"
  })
}
