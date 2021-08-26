provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  count         = 3
}

module "db" {
  source       = "./db"
  server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
  value = module.db.PrivateIP
}