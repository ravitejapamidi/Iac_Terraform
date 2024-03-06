terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type_id

  tags = {
    Name = "Raviteja.pamidi"
  }
}
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_id

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block_id
  instance_tenancy = var.instance_tenancy_id

  tags = {
    Name = "teja"
  }
}


data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_subnet" "main3" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block3
  tags = {
    Name = "Private1"
  }
} 

resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block1
  tags = {
    Name = "private"
  }
}
resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block2
  tags = {
    Name = "public"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "teja.IG"
  }
}
resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = aws_internet_gateway.example.id
  vpc_id              = aws_vpc.example.id
}

resource "aws_vpc" "example" {
  cidr_block = var.cidr_block_id
}
resource "aws_internet_gateway" "example" {}