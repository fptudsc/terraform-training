terraform {
  backend "s3" {
    key        = "terraform/tfstate.tfstate"
    bucket     = "my-remote-terraform-backend-bucket"
    region     = "ap-southeast-1"
    access_key = "your_access_key"
    secret_key = "your_secret_key"
  }
}