
resource "aws_instance" "instance" {
    count  = var.instance_count
    instance_type = var.instance_type
    key_name = var.key_name
    ami = var.ami
    security_groups = [data.aws_security_group.sg.id]
    subnet_id = element(data.aws_subnets.subnet.ids, count.index % length(data.aws_subnets.subnet.ids))
    iam_instance_profile = var.iam
    disable_api_termination = var.api_termination
    tags = var.tags
    user_data = var.userdata_enabled == true ? file("../modules/ec2/userdata.sh") : 0
}