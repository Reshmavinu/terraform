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
variable "env_prefix" {
  description="environment name"
  type=string
}

variable "availability_zone" {
 description="availability zone for subnet"
 type=string
}
variable "ami-id" {
  description="ami-id of launcing ec2"
  type=string
}
variable "instance-type" {
  description="instance type of ec2"
  type=string
}
