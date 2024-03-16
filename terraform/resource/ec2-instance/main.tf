terraform {
    backend "s3" {
        bucket = "learn-state-file-bucket"
        key = "nonprod/ec2/instance/1"
        region  = "ap-south-1"
    }
}


module "instance" {
    source = "../../modules/ec2/"
    instance_count = 1
    state_key = "nonprod/ec2/instance/1/"
    region = "ap-south-1"
    key_name  = "docker-server"
    iam = "ec2-role-for-admin"
    api_termination = false
    instance_type = "t2.micro"
    tags = {
        name = "instance-from-module"
        role = "app"
        terraform = "true"
        hello = "world"
    }
    bucket = "learn-state-file-bucket"

}