resource "aws_instance" "this" {
  ami                    = local.ami
  vpc_security_group_ids = [aws_security_group.allow_tls2.id]
  # instance_type          = "var.instance_type"
  instance_type = local.instance_type
  tags = {
    Name    = local.name
    Purpose = "Terraform practice"
  }
}

resource "aws_security_group" "allow_tls2" {
  name        = "allow_tls2"
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
    Name = "allow_tls2"
  }
}