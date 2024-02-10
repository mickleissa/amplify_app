terraform {
  backend "s3" {
    bucket           = "terraform-backend-2024-omusleh-powerofmath"
    key              = "path/to/my/key"
    region           = "us-east-2"
    # dynamodb_table   ="terraform-powerOfMath-backend"
  }
}
