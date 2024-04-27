terraform {
  backend "s3" {
    bucket         = "iti-terraform-cloud-pd44"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-lock-iti"
  }
}
