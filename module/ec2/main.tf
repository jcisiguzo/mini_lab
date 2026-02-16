resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  vpc_security_group_ids = [ var.sg_id ]
  subnet_id = var.subnet_id
  user_data = var.user_data

  tags = {
    Name = var.instance_name
  }
}