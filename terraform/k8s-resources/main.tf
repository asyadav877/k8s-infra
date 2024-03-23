terraform {
    backend "s3" {
        bucket = "learn-state-file-bucket"
        key = "nonprod/ec2/k8s-resource"
        region = "ap-south-1"
        encrypt = false
    }
}

module "master_node" {
    source = "../modules/ec2/"
    instance_count = 1
    instance_type = "t3.medium"
    ami = "ami-007020fd9c84e18c7"
    key_name = "docker-server"
    iam = "ec2-role-for-admin"
    vpc_id = "vpc-01f6d14a6f1a52c16"
    tags = {
        name = "k8s-master-node"
        role = "k8s"
        env = "stage"
        Name = "k8s-master-node"
    }
    userdata_enabled = true
    root_block_device = [{
        delete_on_termination = true
        volume_type = "gp3"
        volume_size = 15
    }]
}

module "data_node" {
    source = "../modules/ec2/"
    instance_count = 2
    instance_type = "t3.medium"
    ami = "ami-007020fd9c84e18c7"
    key_name = "docker-server"
    iam = "ec2-role-for-admin"
    vpc_id = "vpc-01f6d14a6f1a52c16"
    tags = {
        name = "k8s-worker-nodes"
        role = "k8s"
        env = "stage"
        Name = "k8s-worker-node"
    }
    userdata_enabled = true
    root_block_device = [{
        delete_on_termination = true
        volume_type = "gp3"
        volume_size = 20
    }]
}