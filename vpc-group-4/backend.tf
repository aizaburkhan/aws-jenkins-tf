# virginia/terraform.tfstate
terraform {
  backend "s3" {
    bucket = "3-statefile-backends-ak"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}