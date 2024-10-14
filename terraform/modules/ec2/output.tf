output "instance_ip" {
  description = "La dirección IP pública de la instancia EC2"
  value       = aws_instance.ec2_instance.public_ip  # Asegúrate de que el recurso aws_instance se llame así
}
