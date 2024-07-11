provider "aws"{
 region="ap-south-1"
}

resources "aws_instance" "ec2_instance"{
  instance_type=var.instance_type
  ami_id       =var.ami_id
  key_pair     =var.key_pair
  vpc_id       =var.vpc_id
  subnet_id    =var.subnet_id
  security_group=var.security_group
  tags={
    instance_name ="${var.instance_name}-${count.index+1}  #appending unique index to the instance name with count
  }
}


ouput "instance_ids"{
  description="display the ec2 instance ids"
  value      ={for instance in aws_instance.ec2_instance : "${instance.tags.instance_type}"=>instance.public_id
