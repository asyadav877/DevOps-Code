data "aws_iam_instance_profile" "iam_role" {
  name = var.iam_role
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh")
}


data "aws_security_groups" "sg" {
  tags = {
    role  = var.tags["role"]
    env   = var.tags["env"]
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.state_bucket
    key    = var.vpc_state_key
    region = var.aws_region
  }
}

data "aws_subnets" "subnets" {
  tags = {
    role        = var.subnet
    environment = local.tags["environment"]
  }
}

