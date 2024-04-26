terraform {
  backend "s3" {
    bucket         = "iti-terraform-cloud-pd44"
    key            = "iti-cloud-pd44-tfstate"
    region         = "eu-west-1"
    dynamodb_table = "state-lock-iti"
  }
}
