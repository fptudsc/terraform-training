provider "aws" {
  region = "ap-southeast-1"
}

module "ec2_module" {
  source   = "./ec2"
  ec2_name = "Name From Module"
}

output "module_output" {
  description = "Instance Id of web service provisioned"
  value       = module.ec2_module.instance_id
}