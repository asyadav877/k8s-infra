# data "aws_security_group" "sg" {
#     filter {
#         name = "tag:role"
#         values = [var.tags["role"]]
#     }
    
#     filter {
#         name = "tag:env"
#         values = [var.tags["env"]]
#     }
    
# }
 
data "aws_security_groups" "sg" {
  tags = {
    role = "${var.tags["role"]}"
    env = "${var.tags["env"]}"
  }
}

data "aws_subnets" "subnet" {

    filter {
        name = "vpc-id"
        values = ["${var.vpc_id}"]
    }
    filter {
        name = "tag:role"
        values = [var.tags["role"]]
    }
    
    filter {
        name = "tag:env"
        values = [var.tags["env"]]
    }
}
