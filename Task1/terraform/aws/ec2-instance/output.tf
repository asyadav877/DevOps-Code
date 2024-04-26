// Output of the Instance Id

output "instance_id" {
    value = resource.aws_instance.instance[*].id 
}