resource "aws_instance" "servidor_devops" {
  ami             = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  key_name        = "vockey"
  security_groups = ["devops"]

  tags = {
    Name = var.nome_instancia
  }
}

