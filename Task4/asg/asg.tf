terraform {
  backend "s3" {
    bucket = "demo-bucket"
    key    = "terraform/aws/asg/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "asg" {
  source                                   = "../../Task1/terraform/aws/asg/"
  key                                      = "demo-key"
  instance_type                            = "c6g.xlarge"
  desired_size                             = "0"
  min_size                                 = "0"
  max_size                                 = "2"
  termination_policies                     = ["OldestInstance"]
  ami                                      = "ami-12345632"
  state_bucket                             = "demo-bucket"
  vpc_state_key                            = "aws/vpc/terraform.tfstate"
  health_check_grace_period                = "300"
  health_check_type                        = "ELB"
  capacity_rebalance                       = "true"
  block_device_mappings                    = [{ "device_name" = "/dev/xvda", "volume_size" = "75", "volume_type" = "gp3" }]
  scaleout_scaling_adjustment              = 2
  scaleout_evaluation_periods              = 1
  scaleout_period                          = 60
  scaleout_threshold                       = 60
  scalein_scaling_adjustment               = -1
  scalein_evaluation_periods               = 1
  scalein_period                           = 300
  scalein_threshold                        = 30

  tags = {
    environment = "stage"
    role        = "app"
  }
}



output "asg" {
  description = "Asg name"
  value       = module.asg.asg_name
}

