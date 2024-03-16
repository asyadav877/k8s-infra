variable "instance_count" {
    type = string
    default = 1 
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami" {
    type = string
}

variable "vpc" {
    type = string
}

variable "key_name" {
    type = string
}

variable "api_termination" {
    type = bool
    default = false
}

variable "tags" {
    type = map(string)
    default = {
        name = "default-name"
        role = "default-role"
        terraform = "true"
    }
}

variable "region" {
    type = string
    default = "ap-south-1"
}


variable "root_block_device" {
    type = list(map(string))

}

variable "ebs_block_device" {
    type = list(map(string))
}