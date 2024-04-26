variable "region" {
    type = string
    description = "AWS Region"
    default  = "ap-south-1"
}

variable "vpc_id" {
    type = string
    description = "Id of vpc in where instance will be created"
    default  = "vpc-1245524r45423"
}

variable "instance_count" {
    type = number
    description = "Count for number of instance required"
    default = 1
}

variable  "instance_type" {
    type = string
    description = "instance type"
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    description = "AMI id"
}

variable  "key_name" {
    type        = string
    description = "Key name through which you need to ssh on the server"
}

variable "disable_api_termination" {
    type        = bool
    description = "false: If you want to delete instance through API calls"
    default     = true
}

variable "tags" {
    type        = map(string)
    description = "tags required on the instance and to filter the subnet and security groups"
    default     = {
        "role": "app",
        "type": "private"
    } 
}

variable "root_block_device" {
    type        = list(map(string))
    description = "Configuration of root block storage of instance"
    default     = [{
        "delete_on_termination": true,
        "volume_type": "gp3",
        "volume_size": 20
    }]
}

variable "ebs_block_device" {
    type        = list(map(string))
    description = "Configuration of ebs block storage of instance"
    default     = [{
        "delete_on_termination": false,
        "volume_type": "gp3",
        "volume_size": 20,
        "device_name": "/dev/sdf"
    }]
}