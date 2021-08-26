provider "aws" {
  region = "ap-southeast-1"
}

locals {
  vpc_name_prefix = "AA"
}

variable "vpc_name" {
  type        = string
  description = "Set the name of the VPC"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "my_list" {
  type    = list(string)
  default = ["value 1", "value 2"]
}

variable "my_map" {
  type = map(any)
  default = {
    key1 = "value 1"
    key2 = "value 2"
  }
}

variable "my_tuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "my_object" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "Hello World"
    port = [22, 25, 80]
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Group = "${local.vpc_name_prefix} ${var.vpc_name}"
    Name  = var.vpc_name
  }
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}