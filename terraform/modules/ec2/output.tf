output "instance_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = aws_instance.ec2_instance.public_ip
}
