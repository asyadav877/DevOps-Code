resource "aws_autoscaling_group" "autoscaling_group" {

  name                      = var.asg_name
  vpc_zone_identifier       = data.aws_subnets.subnets.ids
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  min_elb_capacity          = var.min_elb_capacity
  default_cooldown          = var.default_cooldown
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  metrics_granularity       = var.metrics_granularity
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  capacity_rebalance        = var.capacity_rebalance

  tag = var.tags
}

output "asg_name" {
  description = "The name of the autoscaling group"
  value       = aws_autoscaling_group.autoscaling_group.name
}
