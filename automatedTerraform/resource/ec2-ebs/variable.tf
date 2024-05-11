variable "instance_count" {}
variable "ami" {}
variable "key_name" {}
variable "instance_type" {}
variable "vpc" {}
variable "api_termination" {}
variable "region" {}
variable "tags" {
  type = map(string)
}
variable "ebs_block_device" {}
variable "root_block_device" {}
