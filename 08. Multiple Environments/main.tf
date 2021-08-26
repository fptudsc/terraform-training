# terraform plan -var-file=test.tfvars
# terraform plan -var-file=prod.tfvars

provider "aws" {
  region = "ap-southeast-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  count         = var.number_of_servers
}