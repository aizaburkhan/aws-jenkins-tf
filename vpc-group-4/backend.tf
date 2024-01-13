# virginia/terraform.tfstate
terraform {
  backend "s3" {
    bucket = "3-statefile-backends-ak" # << Replace the S3 Bucket name
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "group-4-dynamoDB" # << Replace the DynamoDB Table name
  }
}