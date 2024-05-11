data "aws_subnet" "subnet" {
    vpc_id = var.vpc
    filter {
        name = "tag:role"
        values = ["${var.tags["role"]}"]
    }
}

data "aws_security_group" "sg" {
    filter {
        name = "tag:role"
        values = ["${var.tags["role"]}"]
    }
}