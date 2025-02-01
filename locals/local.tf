locals {
  ami = data.aws_ami.chinna.id
  instance_type = "t2.micro"
  name = "${var.Project}-${var.Component}-${var.Environment}"
}