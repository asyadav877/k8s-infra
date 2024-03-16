data "aws_security_group" "sg" {
    filter {
        name = "tag:role"
        values = [var.tags["role"]]
    }
}

data "aws_subnet" "subnet" {
    vpc_id = "vpc-01f6d14a6f1a52c16"

    filter {
        name = "tag:role"
        values = [var.tags["role"]]
    }
}