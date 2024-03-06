resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  

  tags = {
    Name = "teja_vpc"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.85.0/24"

  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "teja_gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "teja_gw"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.teja_gw.id
  }

     tags = {
    Name = "teja_route_table"
  
  }
}
resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.route_table.id
}