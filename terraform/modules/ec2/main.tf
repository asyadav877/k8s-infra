# terraform {
#     backend "s3" {
#         bucket = var.bucket
#         state_key = var.state_key
#         region  = var.region
#     }
# }

resource "aws_instance" "instance" {
    count  = var.instance_count
    instance_type = var.instance_type
    key_name = var.key_name
    ami = var.ami
    security_groups = [data.aws_security_group.sg.id]
    subnet_id = data.aws_subnet.subnet.id
    iam_instance_profile = var.iam
    disable_api_termination = var.api_termination
    tags = var.tags
}

