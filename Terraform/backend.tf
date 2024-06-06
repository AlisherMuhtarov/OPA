terraform {
  backend "s3" {
    bucket = "terraform-testing-backend-alisher"
    key = "opa/terraform.tfstate" 
    region = "us-east-1"
    dynamodb_table = "terraform-sep-state-lock"
  }
}