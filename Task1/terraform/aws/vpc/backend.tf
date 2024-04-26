terraform {
    backend "s3" {
        region = "ap-south-1"
        bucket = "learn-state-file-bucket"
        key = "aws/vpc/terraform.tfstate"
        encrypt = false
        # dynamodb_table = "tf-statelock-db"
    }
}