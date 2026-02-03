1) create a VPC in us-east-1 with the local name main the CIDR block 10.0.0.0/16

2) create a security group with the local name allow_tls.the security group allow
HTTPS(port 443) inbound from the VPC CIDR block and all traffic outbound. 
The security group must in be the above VPC

(Optional) - Attach IGW and RT

3) Create a subnet with the local name Public_subnet in the above VPC in the
availability zone us-east-1a the subnet CIDR block 10.0.1.0/24

4) Create an AWS Linux Ec2 instance in the public subnet above. The instance size is
t3.micro. choose a suitable AMI for us-east-1, apply the above security group to the
instance and ensure the instance gets a public ip.

5) You need to display the public ip of the instance, however this should only be displayed
as an output until the security group ingress rule has been created to avoid access issues
on port 443.

6) validate the configuration.

7) destroy the infrastructure.# mini_lab
