output "vpc_id" {
 value= aws_vpc.VPC_resource.id
}
output "subnet_id" {
 value= aws_subnet.subnet_id.id
}
output "security_group" {
 value= aws_security_group.firewall.id
}
output "instance_id" {
 value= aws_instance.ec2-instance.id
}
