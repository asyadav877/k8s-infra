output "bucket_arn"{
    value  = resource.aws_s3_bucket.bucket.arn
}

output "bucket_name"{
    value  = resource.aws_s3_bucket.bucket.id
}