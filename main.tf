module "vpc" {
  source = "./module/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name
}
module "subnet" {
  source = "./module/subnet"
  subnet_cidr_block = var.subnet_cidr_block
  vpc_id = module.vpc.vpc_id
  availability_zone = var.availability_zone
  subnet_name = var.subnet_name
}
module "sg" {
  source = "./module/sg"
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name
}
module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
  igw_name = var.igw_name
}
module "rt" {
  source = "./module/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
  rt_name = var.rt_name
}
module "instance" {
  source = "./module/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.subnet.subnet_id
  sg_id = module.sg.sg_id
  availability_zone = var.availability_zone
  instance_name = var.instance_name
  user_data = var.user_data
}