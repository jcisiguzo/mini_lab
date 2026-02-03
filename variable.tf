variable "cidr_block" {
  description = "cidr block for vpc and subnet"
  type = list
}
variable "name_tag" {
  description = "names tag"
  type = list
}
variable "avail_zone" {
  description = "availability_zone"
  type = string
}
variable "ami_id" {
  description = "ec2 ami id"
  type = string
}
variable "inst_type" {
  description = "instance type"
  type = string
}