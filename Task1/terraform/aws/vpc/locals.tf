
locals {
  name   = "demo-vpc"
  region = "ap-south-1"

  vpc_cidr = "10.100.40.0/22"
  availaibility_zones = slice(data.aws_availability_zones.azs.names, 0, var.az_count)

  tags = {
    environment  = "nonprod"
    component    = "network"
    subcomponent = "vpc"
  }
}