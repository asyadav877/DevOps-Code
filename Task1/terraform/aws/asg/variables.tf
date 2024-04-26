variable "state_bucket" {
  type = string
}

variable "vpc_state_key" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "asg_name" {
  type    = string
  default = "ap-south-1"
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "iam_role" {
  type = string
}

variable "key" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "ebs_optimized" {
  type    = bool
  default = true
}

variable "block_device_mappings" {
  type = list(map(string))
  default = [
    {
      device_name = "/dev/sda1"
      volume_type = "gp3"
      volume_size = 75
    }
  ]
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

variable "enable_detailed_monitoring" {
  type    = bool
  default = false
}

variable "lt_version" {
  type    = string
  default = ""
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "desired_size" {
  type = string
}

variable "health_check_grace_period" {
  type    = number
  default = 300
}

variable "health_check_type" {
  type    = string
  default = "ELB"
}

variable "min_elb_capacity" {
  description = "Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes"
  default     = 0
}

variable "default_cooldown" {
  type    = number
  default = 300
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = list(string)
  default     = ["Default"]
}

variable "suspended_processes" {
  description = "A list of processes to suspend for the Auto Scaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer"
  type        = list(string)
  default     = []
}

variable "metrics_granularity" {
  description = "The granularity to associate with the metrics to collect. The only valid value is 1Minute"
  default     = "1Minute"
}

variable "wait_for_capacity_timeout" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
  default     = "10m"
}


variable "scaleout_scaling_adjustment" {
  description = "The number of instances by which to scale. adjustment_type determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity."
  default     = 1
}

variable "scaleout_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start."
  default     = 300
}

variable "scaleout_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 2
}

variable "scaleout_period" {
  description = "The period in seconds over which the specified statistic is applied."
  default     = 120
}

variable "scaleout_threshold" {
  description = "The value against which the specified statistic is compared."
  default     = 60
}

variable "scalein_scaling_adjustment" {
  description = "The number of instances by which to scale. adjustment_type determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity."
  default     = -1
}

variable "scalein_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start."
  default     = 300
}

variable "scalein_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 2
}

variable "scalein_period" {
  description = "The period in seconds over which the specified statistic is applied."
  default     = 120
}

variable "scalein_threshold" {
  description = "The value against which the specified statistic is compared."
  default     = 35
}


variable "capacity_rebalance" {
  description = "Indicates whether capacity rebalance is enabled. Otherwise, capacity rebalance is disabled."
  type        = bool
  default     = false
}

variable "override_userdata" {
  default = ""
  description = "Pass user data base64encode format to direclty pass in launch template"
}
