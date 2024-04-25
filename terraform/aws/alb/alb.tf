

resource "aws_lb" "alb" {
    count                               = var.create_lb ? 1 : 0
    name                                = var.name
    load_balancer_type                  = var.load_balancer_type
    internal                            = var.internal
    security_groups                     = data.aws_security_groups.sg.ids
    subnets                             = toset(data.aws_subnets.subnet.ids)
    enable_deletion_protection          = var.enable_deletion_protection
    enable_cross_zone_load_balancing    = var.enable_cross_zone_load_balancing
    tags                                = var.tags     
}