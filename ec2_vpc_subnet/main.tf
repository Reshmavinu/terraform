resource "aws_vpc" "VPC_resource"{
  vpc_id=var.VPC_cidr
}
resource "aws_subnet" "subnet_id" {
  vpc_id     = aws_vpc.VPC_resource.id
  availability_zone = var.availability_zone
   tags = {
    Name = "Main"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC_resource.id

  tags = {
    Name = "main-gw"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.VPC_resource.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "RTB"
  }
}
