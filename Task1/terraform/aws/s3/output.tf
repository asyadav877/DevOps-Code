output "bucket_arn"{
    value  = resource.aws_s3_bucket.bucket.arn
    description = "AWS S3 Bucket ARN"
}

output "bucket_name"{
    value  = resource.aws_s3_bucket.bucket.id
    description = "AWS S3 Bucket Name"
}