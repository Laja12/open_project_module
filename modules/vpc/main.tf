resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "demo-vpc"
  }
}
 
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "demo-igw-gateway"
  }
}
 
resource "aws_route_table" "public_rt1" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = "public-route-table1"
  }
}
 
resource "aws_route_table_association" "rt_assc_1" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt1.id
}
 
resource "aws_route_table_association" "rt_assc_2" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt1.id
}
 
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.public_subnet_a_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "public-subnet-a"
  }
}
 
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.public_subnet_b_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "public-subnet-b"
  }
}
 
