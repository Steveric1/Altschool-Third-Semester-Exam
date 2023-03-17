//create a security group 
resource "aws_security_group" "web" {
  name        = "traffic"
  description = "Allow traffic from anywhere"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.web_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.fromPort
      to_port     = ingress.value.toPort
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}