output "private_key_path" {
  description = "Ruta del archivo de clave privada para SSH"
  value       = local_file.private_key.filename
}

output "key_name" {
  description = "El nombre de la clave SSH"
  value       = aws_key_pair.deployer_key.key_name
}