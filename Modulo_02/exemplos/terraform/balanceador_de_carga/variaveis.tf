variable "key_name" {
  description = "Chave de Seguranca"
  type        = string
  default     = "jmhal"
}

variable "bucket_name" {
  description = "Bucket para Sstado"
  type        = string
  default     = "devops20240412"
}


output "public_ip_loadbalancer" {
  value       = aws_instance.balanceadordecarga.public_ip
  description = "IP Publico do Balanceador de Carga"
}

output "public_ip_web01" {
  value       = aws_instance.web01.public_ip
  description = "IP Publico do Web01"
}

output "public_ip_web02" {
  value       = aws_instance.web02.public_ip
  description = "IP Publico do Web02"
}

output "private_ip_web01" {
  value       = aws_instance.web01.private_ip
  description = "IP Privado do Web01"
}

output "private_ip_web02" {
  value       = aws_instance.web02.private_ip
  description = "IP Privado do Web02"
}



