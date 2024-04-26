
module "vpc" {
  source                              = "terraform-aws-modules/vpc/aws"
  name                                = local.name
  cidr                                = local.vpc_cidr
  azs                                 = local.availaibility_zones
  private_subnets                     = ["10.100.40.0/24", "10.100.41.0/24"]
  public_subnets                      = ["10.100.42.0/25", "10.100.42.128/25"]
  private_subnet_names                = [for i in range(length(local.availaibility_zones)) : format("${local.name}-private-subnet-${i+1}")]
  public_subnet_names                 = [for i in range(length(local.availaibility_zones)) : format("${local.name}-public-subnet-${i+1}")]
  create_multiple_public_route_tables = true
  public_dedicated_network_acl        = true
  private_dedicated_network_acl       = true
  enable_dns_hostnames                = true
  enable_nat_gateway                  = true
  single_nat_gateway                  = false
  one_nat_gateway_per_az              = true
  tags                                = local.tags
}
