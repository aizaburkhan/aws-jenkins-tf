# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr_block

  tags = {
    Name = "group4-vpc"
  }
}

# subnet-1
resource "aws_subnet" "sb1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet1-cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "subnet-1"
  }
}

# subnet-2
resource "aws_subnet" "sb2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet2-cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "subnet-2"
  }
}

# subnet-3
resource "aws_subnet" "sb3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet3-cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "subnet-3"
  }
}

# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gw"
  }
}

# route table
resource "aws_route_table" "rt_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.rt-table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "rt-table"
  }
}

# subnet-1 association 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sb1.id
  route_table_id = aws_route_table.rt_table.id
}

# subnet-2 association 
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sb2.id
  route_table_id = aws_route_table.rt_table.id
}

# subnet-3 association 
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.sb3.id
  route_table_id = aws_route_table.rt_table.id
}
