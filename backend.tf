terraform {
  backend "s3" {
    bucket         = "limtruong-bucket"
    key            = "limtruong-state"
    region         = "us-east-1"
    dynamodb_table = "b2111933-table"
  }
}