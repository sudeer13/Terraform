provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2-varible" {
    ami = "ami-00c39f71452c08778"
    instance_type = var.instancetype
    tags = {
        Name = "FirstVm"
  }
}
