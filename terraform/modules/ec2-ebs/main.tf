
resource "aws_instance" "instance-ebs" {
    count  = var.instance_count
    instance_type = var.instance_type
    ami = var.ami
    subnet_id = data.aws_subnet.subnet.id
    key_name = var.key_name
    disable_api_termination = var.api_termination
    security_groups = [data.aws_security_group.sg.id]
    tags = var.tags

    dynamic "root_block_device" {
        for_each = var.root_block_device
        content {
            delete_on_termination = lookup(root_block_device.value, "delete_on_termination", true)
            volume_type           = lookup(root_block_device.value, "volume_type", "gp3")
            volume_size           = lookup(root_block_device.value, "volume_size", 15)
        }
    }

    dynamic "ebs_block_device" {
        for_each = var.ebs_block_device
        content {
            delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", false)
            volume_size = lookup(ebs_block_device.value, "volume_size", 10)
            volume_type = lookup(ebs_block_device.value, "volume_type", "gp3")
            device_name = lookup(ebs_block_device.value, "device_name", null)

        }
    }
}