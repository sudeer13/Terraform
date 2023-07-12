provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name = "linux-key"
  vpc_security_group_ids = [aws_security_group.Allow_SSH.id]
  tags = {
    Name = "Webserver"
  }
}

resource "aws_security_group" "Allow_SSH" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"  
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  
  }
  tags = {
    Name = "Allow_ssh"
  }
}

resource "aws_eip" "public_IP" {
  domain   = "vpc"  
}

resource "aws_eip_association" "ec2-eip-association" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.public_IP.id
}
