terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "terraform-backend-samim"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-dynamodb-samim"
    encrypt        = true
  }
}
