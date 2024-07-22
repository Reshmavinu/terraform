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
