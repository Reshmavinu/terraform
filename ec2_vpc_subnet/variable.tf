variable "region" {
 description="the region where aws resources to be created"
 type=string
}

variable "VPC_cidr" {
 description="the cidr block for vpc"
 type=string
}

variable "subnet_cidr" {
 description="the cidr block for subnet"
 type=string
}

variable "availability_zone" {
 description="availability zone for subnet"
 type=string
}
