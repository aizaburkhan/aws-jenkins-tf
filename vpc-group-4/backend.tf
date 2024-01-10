# virginia/terraform.tfstate
terraform {
  backend "s3" {
    bucket = "3-statefile-backends-ak"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "s3-statefile-backends"
  # region = var.region
}

# resource "aws_dynamodb_table" "basic-dynamodb-table" {
#   name           = "lock-state"
#   billing_mode   = "PROVISIONED"
#   read_capacity  = 5
#   write_capacity = 5
#   hash_key       = "TestTableHashKey"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name        = "lock-state"
#     Environment = "backends-by-region"
#   }
# }