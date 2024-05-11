
terraform {
    backend "s3" {
        bucket = "learn-state-file-bucket"
        key = "nonprod/ec2/intance-ebs/1"
        region = "ap-south-1"
        encrypt = true
    }
}

module "ebs-instance" {
    source = "../../modules/ec2-ebs"

    instance_count   = var.instance_count
    ami              = var.ami
    key_name         = var.key_name
    instance_type    = var.instance_type
    vpc              = var.vpc
    api_termination  = var.api_termination
    region           = var.region
    tags             = var.tags
    ebs_block_device = var.ebs_block_device
    root_block_device = var.root_block_device
    
}