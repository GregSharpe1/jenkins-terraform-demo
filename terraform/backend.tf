terraform {
  backend "s3" {
    bucket = "demo-state-s3"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}