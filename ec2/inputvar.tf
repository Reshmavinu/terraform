variable "instance_type"{
     description="The EC2 instance type to be created"
     default="t2.micro"
}
variable "ami_id"{
     description="EC2 instance ami_id"
     default="ami-0c2af51e265bd5e0e"
}

variable "key_pair"{
     description="EC2 instance key pair"
     default="devops"
}
variable "vpc_id"{
     description="VPC- instance will be created"
     default="vpc-09336b6bcc12b4171"
}
variable "subnet_id"{
     description="subnet where instance will be created"
     default="subnet-0eba425f122f68709"
}

variable "security_group"{
     description="EC2 instance security group"
     default="sg-0832e458dcacab5d1"
}
variable "instance_name"{
     description="name of the instance"
     default="demo-terraform"
}
variable "instance_count"{
     description="no. of instance to be created"
     default=1
}
