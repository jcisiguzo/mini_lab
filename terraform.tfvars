vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"
ami_id = "ami-0b6c6ebed2801a5cb"
instance_type = "t3.micro"

# user_data
user_data = <<-EOF
#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx
EOF

# resource name
vpc_name = "module_vpc"
subnet_name = "module_subnet"
sg_name = "module_sg"
igw_name = "module_igw"
rt_name = "module_rt"
instance_name = "module_instance"