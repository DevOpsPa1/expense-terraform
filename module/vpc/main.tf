resource "aws_vpc" "main" {
  cidr_block         = var.vpc_cidr_block
  tags               = merge(var.tags, { Name = var.env })
}


resource "aws_subnet" "public" {
  count              = length(var.public_subnets)
  vpc_id             = aws_vpc.main.id
  cidr_block         = var.public_subnets[count.index]
  tags               = merge(var.tags, { Name = "public_subnets" })
  availability_zone  = var.azs[count.index]

}

resource "aws_subnet" "web" {
  count              = length(var.web_subnets)
  vpc_id             = aws_vpc.main.id
  cidr_block         = var.web_subnets[count.index]
  tags               = merge(var.tags, { Name = "web_subnets"})
  availability_zone  = var.azs[count.index]

}

resource "aws_subnet" "app" {
  count              = length(var.app_subnets)
  vpc_id             = aws_vpc.main.id
  cidr_block         = var.app_subnets[count.index]
  tags               = merge(var.tags, { Name = "app_subnets" })
  availability_zone  = var.azs[count.index]

}

resource "aws_subnet" "db" {
  count              = length(var.db_subnets)
  vpc_id             = aws_vpc.main.id
  cidr_block         = var.db_subnets[count.index]
  tags               = merge(var.tags, { Name = "db_subnets" })
  availability_zone  = var.azs[count.index]

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags               = merge(var.tags, { Name = "public" })
}

resource "aws_route_table" "web" {
  vpc_id = aws_vpc.main.id
  tags               = merge(var.tags, { Name = "web" })
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id
  tags               = merge(var.tags, { Name = "app" })
}

resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id
  tags               = merge(var.tags, { Name = "db" })
}