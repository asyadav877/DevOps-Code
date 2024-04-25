output "vpc_id" {
    value = module.vpc.vpc_id
    description = "VPC Id"
}

output "azs" {
    value = module.vpc.azs
    description = "Availaibility zones in which vpc subnets are availaible"
}

output "public_subnet" {
    value = module.vpc.public_subnets
    description = "List of public subnets created"
}

output "public_subnet_route_table_ids" {
    value = module.vpc.public_route_table_ids
    description = "List of public subnets rt-table ids"
}

output "private_subnet" {
    value = module.vpc.private_subnets
    description = "List of private subnets created"
}

output "private_subnet_route_table_ids" {
    value = module.vpc.private_route_table_ids
    description = "List of private subnets rt-table ids"
}

output "nat_gateway_ids" {
    value = module.vpc.natgw_ids
    description = "List of Nat gateway ids"
}

output "nat_public_ips" {
    value = module.vpc.natgw_ids
    description = "List of Elastic Ips associated with nat gatways"
}

output "igw_id" {
    value = module.vpc.natgw_ids
    description = "Internet Gateway Id"
}