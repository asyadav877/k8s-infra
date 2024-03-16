variable "bucket_name" { 
    type = string
    default = "default-bucket-name"
    description = "This is the variable for a bucket name"
}

variable "tags" {
    type = map(string)
    default = {
        Name = "default-bucket-name"
        role = "app"
        terraform = "true"
        env = "nonprod"
    }
}
