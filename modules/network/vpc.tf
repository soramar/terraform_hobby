resource "aws_vpc" "tfhobby_vpc" {
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "tfhobby_vpc"
    }
}

variable "cidr_block" {
    description = "The CIDR block for the VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    description = "The name of the VPC"
    type = string
    default = "tfhobby_vpc"
}
