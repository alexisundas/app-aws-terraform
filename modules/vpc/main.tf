#VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "EC2-VPC"
  }
}

# Public and Private Subnet

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidr)
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_names[count.index]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "InternetGateway-Ec2"
  }
}

# Route Table
resource "aws_route_table" "route-tb" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # Public
    gateway_id = aws_internet_gateway.internet-gw.id
  }
  tags = {
    Name = "RouteTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "route-tba" {
  count = length(var.subnet_cidr)
  subnet_id = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.route-tb.id
}