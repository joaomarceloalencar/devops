resource "aws_security_group" "kubernetes" {
  name        = "kubernetes"
  description = "Grupo de Seguranca do Cluster Kubernetes"

  tags = {
    Name = "kubernetes"
  }
}

resource "aws_vpc_security_group_ingress_rule" "permitir_trafego_interno" {
  security_group_id = aws_security_group.kubernetes.id
  referenced_security_group_id = aws_security_group.kubernetes.id

  from_port = -1 
  to_port = -1
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "permitir_ssh_ipv4" {
  security_group_id = aws_security_group.kubernetes.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "permitir_http_ipv4" {
  security_group_id = aws_security_group.kubernetes.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80 
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "permitir_nodeport_ipv4" {
  security_group_id = aws_security_group.kubernetes.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 30000
  ip_protocol       = "tcp"
  to_port           = 32767 
}

resource "aws_vpc_security_group_egress_rule" "trafego_saida" {
  security_group_id = aws_security_group.kubernetes.id
  from_port        = -1
  to_port          = -1
  ip_protocol         = "-1"
  cidr_ipv4        = "0.0.0.0/0"
}
