provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "db" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance
data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
  values = data.aws_instance.dbsearch.availability_zone
}