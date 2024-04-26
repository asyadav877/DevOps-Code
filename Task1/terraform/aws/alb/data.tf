
data "aws_subnets" "subnet" {
    filter {
        name = "vpc-id"
        values = ["${var.vpc_id}"]
    }
    filter {
        name = "tag:type"
        values = [var.tags["type"]]
    }
}

data "aws_security_groups" "sg" {
  tags = {
    role = "${var.tags["role"]}"
    env = "${var.tags["env"]}"
  }
}