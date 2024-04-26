output "alb_arn" {
    value = resource.aws_lb.alb[*].arn
}

output "dns_name" {
    value = resource.aws_lb.alb[*].dns_name
}