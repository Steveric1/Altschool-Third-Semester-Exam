#create a vpc with multiple subnets
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

//use data subnets to get the subnets
data "aws_availability_zones" "available" {}

//create a public-1A subnet
resource "aws_subnet" "public-1A" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-1A_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.public1}-public-1A"
  }
}

//create a public-1B subnet
resource "aws_subnet" "public-1B" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-1B_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.public2}-public-1B"
  }
}

//create a public-1C subnet
resource "aws_subnet" "public-1C" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-1C_cidr
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.public3}-public-1C"
  }
}

//create a private-1A subnet
resource "aws_subnet" "private-1A" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-1A_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.private1}-private-1A"
  }
}

//create a private-1B subnet
resource "aws_subnet" "private-1B" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-1B_cidr
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.private2}-private-1B"
  }
}

//create a private-1C subnet
resource "aws_subnet" "private-1C" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private-1C_cidr
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "${var.private3}-private-1C"
  }
}

//create a route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.route}-public"
  }
}

//create a subnet route table association for public-1A subnet
resource "aws_route_table_association" "public-1A" {
  subnet_id      = aws_subnet.public-1A.id
  route_table_id = aws_route_table.public.id
}

//create a subnet route table association for public-1B subnet
resource "aws_route_table_association" "public-1B" {
  subnet_id      = aws_subnet.public-1B.id
  route_table_id = aws_route_table.public.id
}

//create a subnet route table association for public-1C subnet
resource "aws_route_table_association" "public-1C" {
  subnet_id      = aws_subnet.public-1C.id
  route_table_id = aws_route_table.public.id
}

//create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.gate_way}-igw"
  }
}