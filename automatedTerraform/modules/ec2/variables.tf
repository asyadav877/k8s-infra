variable "ami" {
    type = string
    description = "AMI of the instance"
    default = "ami-026255a2746f88074"
}

variable "region" {
    type = string
    description = "This is the region on which infra will be provisioned"
    default = "ap-south-1"
}

variable "state_key" {
    type = string
    default = "nonprod/ec2/instance/"
}
variable "key_name" {
    type = string
    description = "key name of the instance"
    default = "default-key"
}

variable "vpc_id" {
    type = string
    description = "This is the vpc id"
}

variable "instance_count" { 
    type = number
    default = 1
    description = "count of instances"
}

variable "userdata_enabled" {
    type = bool
    default = false
}

variable "iam" {
    type = string
    default = "default-iam-role"
}

variable "api_termination" {
    type = bool
    description = "Enable of disable api termination protection"
    default = false
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "This is the ec2 instance type"
}

variable "tags" {
    type = map(string)
    default = {
        name = "terraform-launched-server"
        role = "app"
        terraform = "true"
    }
}

variable "bucket" {
    type = string
    description = "This is the name of the s3 bucket"
    default = "learn-state-file-bucket"
}

variable "root_block_device" {
    type = list(map(string))

}