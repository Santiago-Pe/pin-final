output "private_key_path" {
  description = "Ruta del archivo de clave privada para SSH"
  value       = local_file.private_key.filename
}
