resource "aws_instance" "controller" {
  ami             = var.ami_id 
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [ aws_security_group.kubernetes.name ]

  tags = {
    Name = "controller"
  }
}

resource "aws_instance" "worker01" {
  ami             = var.ami_id
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [ aws_security_group.kubernetes.name ]

  tags = {
    Name = "worker01"
  }
}

resource "aws_instance" "worker02" {
  ami             = var.ami_id 
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [ aws_security_group.kubernetes.name ]

  tags = {
    Name = "worker02"
  }
}
