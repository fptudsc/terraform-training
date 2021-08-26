provider "aws" {
  region = "ap-southeast-1"
}

module "db_tier" {
  source = "./db"
}

module "web_tier" {
  source     = "./web"
  depends_on = [module.db_tier]
}

output "PrivateIP" {
  value = module.db_tier.PrivateIP
}

output "PublicIP" {
  value = module.web_tier.PublicIp
}