output "instance_id" {
    value = resource.aws_instance.instance-ebs[*].id
}

output "private_ip" {
    value = resource.aws_instance.instance-ebs[*].private_ip
}