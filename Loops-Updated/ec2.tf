resource "aws_instance" "expense" {
  count = length(var.instances)
  #count = 3
  ami = var.ami
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = var.environment == "prod" ? "t2.small" : var.instance_type
  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  ingress {
    from_port       = var.ingress_from_port
    to_port         = var.ingress_to_port
    protocol        = "tcp"
    cidr_blocks      = var.cidr_blocks
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = var.cidr_blocks
  }

  tags = var.sg_tags
}