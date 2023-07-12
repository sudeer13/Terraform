terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.3.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}


resource "aws_instance" "first-ec2" {
    ami = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"
    tags = {
        Name = "FirstVm"
  }
}

resource "aws_instance" "second-ec2" {
    ami = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"
    tags = {
        Name = "SecondVm1"
  }
}
