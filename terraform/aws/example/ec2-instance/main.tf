terraform {
    backend "s3" {
        bucket = "learn-state-file-bucket"
        key    = "aws/ec2-instance/nonprod/instance.tf"
        region = "ap-south-1"
    }
}

module "instance" {
    source = "../../ec2-instance/"
    region = "ap-south-1"
    vpc_id = "vpc-01f6d14a6f1a52c16"
    instance_count = 1
    ami_id = "ami-001843b876406202a"
    key_name = "docker-server"
    disable_api_termination = true
    root_block_device = [{
        delete_on_termination = true
        volume_type = "gp3"
        volume_size = 10
    }]

    ebs_block_device = [{
        device_name = "/dev/sdf"
        delete_on_termination = false
        volume_type = "gp3"
        volume_size = 17
    }]

    tags = {
        role = "k8s"
        env  = "stage"
    }
}