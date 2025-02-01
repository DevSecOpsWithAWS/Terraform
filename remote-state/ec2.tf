resource "aws_instance" "terraform" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_tls3.id]
  instance_type          = "t2.micro"
  tags = {
    Name    = "Terraform-demo"
    Purpose = "Terraform practice"
  }
}

resource "aws_security_group" "allow_tls3" {
  name        = "allow_tls3"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls3"
  }
}