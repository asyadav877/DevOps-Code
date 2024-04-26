resource "aws_autoscaling_policy" "ScaleOut" {
  name                   = "terraform-ScaleOut"
  scaling_adjustment     = var.scaleout_scaling_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.scaleout_cooldown
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}

resource "aws_cloudwatch_metric_alarm" "High-CPU-Utilization" {
  alarm_name = format("%s-%s-ASG-High-CPU-Utilization", var.asg_name, var.tags["role"])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.scaleout_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.scaleout_period
  statistic           = "Average"
  threshold           = var.scaleout_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoscaling_group.name
  }

  alarm_description = "This metric monitor EC2 instance cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.ScaleOut.arn]

}

resource "aws_autoscaling_policy" "ScaleIn" {
  name                   = "terraform-ScaleIn"
  scaling_adjustment     = var.scalein_scaling_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.scalein_cooldown
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}

resource "aws_cloudwatch_metric_alarm" "Low-CPU-Utilization" {
  alarm_name = format("%s-%s-ASG-High-CPU-Utilization", var.asg_name, var.tags["role"])
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.scalein_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.scalein_period
  statistic           = "Average"
  threshold           = var.scalein_threshold

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoscaling_group.name
  }

  alarm_description = "This metric monitor EC2 instance cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.ScaleIn.arn]

}