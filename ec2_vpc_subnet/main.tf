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
\* ###internet gateway should be created before route table### */
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC_resource.id

  tags = {
    Name = "${var.env_prefix}-internetgateway"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.VPC_resource.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.env_prefix}-routetable"
  }
}
#############security group###############
resource "aws_security_group" "firewall" {
  name        = "${var.env_prefix}-sg"
  description = "Allow traffic"
  vpc_id      = aws_vpc.VPC_resource.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "application nginx port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   ########### allowing all protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-security-group"
  }
}
  #first method
  key_name = "TF_key"
  

  tags = {
    Name = "Terraform Ec2"
  }
}

#keypair second method for Key_pair
###########public key to be stored in the generated ec2
resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
#########private key to be stored in the local vm so that we can connect to  generated ec2 using "ssh ubuntu@<ipaddress> -i <private key name here it is tfkey" & chmod 400 tfkey
resource "local_file" "TF-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "tfkey"
}
resource "aws_instance" "ec2-instance" {
  ami                     = var.ami-id
  instance_type           = var.instance-type
  subnet_id               = aws_subnet.subnet_id.id
  security_group          = aws_security_group.firewall.id
  }
