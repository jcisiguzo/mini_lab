variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "ami_id" {}
variable "instance_type" {}

# user data
variable "user_data" {}


# resource name
variable "vpc_name" {}
variable "subnet_name" {}
variable "sg_name" {}
variable "igw_name" {}
variable "rt_name" {}
variable "instance_name" {}