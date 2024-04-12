resource "aws_instance" "balanceadordecarga" {
  ami             = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = ["web"]

  tags = {
    Name = "balanceadordecarga"
  }
}

resource "aws_instance" "web01" {
  ami             = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = ["web"]

  tags = {
    Name = "web01"
  }
}

resource "aws_instance" "web02" {
  ami             = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = ["web"]

  tags = {
    Name = "web02"
  }
}



