# terraform import aws_vpc.myvpc2 vpc_id

provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}