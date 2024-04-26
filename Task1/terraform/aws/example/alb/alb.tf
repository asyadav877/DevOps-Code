terraform {
    backend "s3" {
        bucket = "learn-state-file-bucket"
        key    = "terraform/alb/example/terraform.tfstate"
        region = "ap-south-1"
    }
}


module "alb" {
    source                              = "../../alb/"
    create_lb                           = true
    vpc_id                              = "vpc-01f6d14a6f1a52c16"
    name                                = "demo-alb"
    load_balancer_type                  = "application"
    internal                            = false
    enable_deletion_protection          = false
    enable_cross_zone_load_balancing    = false
    tags = {
        role = "k8s"
        env  = "stage"
        type = "public"
    }
}