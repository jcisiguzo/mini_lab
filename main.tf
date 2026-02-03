/* Project on Terraform a mini lab.


*/

resource "aws_vpc" "mini_lab_vpc" {
  cidr_block = var.cidr_block[0]

  tags = {
    Name = var.name_tag[0]
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.mini_lab_vpc.id
  availability_zone = var.avail_zone
  cidr_block = var.cidr_block[1]

  tags = {
    Name = var.name_tag[1]
  }
}

resource "aws_internet_gateway" "mini_lab_gw" {
  vpc_id = aws_vpc.mini_lab_vpc.id

  tags = {
    Name = var.name_tag[2]
  }
}

resource "aws_route_table" "mini_lab_rt" {
  vpc_id = aws_vpc.mini_lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mini_lab_gw.id
  }
  tags = {
    Name = var.name_tag[3]
  }
}

resource "aws_route_table_association" "mini_lab_rta" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.mini_lab_rt.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_vpc.mini_lab_vpc.id

  tags = {
    Name = var.name_tag[4]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.mini_lab_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "ec2_mini_lab" {
  ami           = var.ami_id
  instance_type = var.inst_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]

  tags = {
    Name = var.name_tag[5]
  }
}

output "mini_lab_out" {
  value = aws_instance.ec2_mini_lab.public_ip
  depends_on = [ aws_vpc_security_group_ingress_rule.allow_tls_ipv4 ]
}