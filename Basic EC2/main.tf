# deploy a basic EC2 instance in 
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
  ami           = "ami-0dfdff9941ebfbd48"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
# terraform init - it initializes the current directory
# terraform plan - it creates an excution plan based on our terraform configuration file and display the changes that Terraform will make to our infrastructure
# terraform apply - it executes the current directory with the changes described in our terraform configuration files