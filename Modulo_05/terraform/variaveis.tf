variable "ami_id" {
  description = "ID da AMI do Ubuntu"
  type        = string
  default     = "ami-0866a3c8686eaeeba"
}

output "controller_public_ip" {
  value       = aws_instance.controller.public_ip
  description = "IP Publico do Controller"
}

output "controller_instance_id" {
  value       = aws_instance.controller.id
  description = "Identificador da Instancia do Controller"
}

output "worker01_public_ip" {
  value       = aws_instance.worker01.public_ip
  description = "IP Publico do Worker 01"
}

output "worker01_instance_id" {
  value       = aws_instance.worker01.id
  description = "Identificador da Instancia do Worker 01"
}

output "worker02_public_ip" {
  value       = aws_instance.worker02.public_ip
  description = "IP Publico do Worker 02"
}

output "worker02_instance_id" {
  value       = aws_instance.worker02.id
  description = "Identificador da Instancia do Worker 02"
}
