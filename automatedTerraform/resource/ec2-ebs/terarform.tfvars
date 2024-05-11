instance_count = 1
ami = "ami-026255a2746f88074"
key_name = "docker-server"
instance_type = "t2.micro"
vpc = "vpc-01f6d14a6f1a52c16"
api_termination = false
region = "ap-south-1"

tags = {
    name = "tf-instance"
    role = "app"
    terraform = "true"
}

ebs_block_device = [
    {
        delete_on_termination = true
        volume_type = "gp3"
        volume_size = 20
        device_name = "/dev/sdf"
    }
]

root_block_device = [
    {
        delete_on_termination = true
        volume_type  = "gp2"
    }
]