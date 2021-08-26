
resource "aws_instance" "web" {
  ami             = "ami-032598fcc7e9d1c7a"
  instance_type   = "t2.micro"
  security_groups = [module.sg.SGName]
  user_data       = file("./web/startup-script.sh")
  tags = {
    Name = "Web Server"
  }
}

module "eip" {
  source      = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"
}

output "PublicIp" {
  value = module.eip.PublicIP
}