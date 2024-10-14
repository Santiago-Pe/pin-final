output "security_group_id" {
  description = "ID del grupo de seguridad"
  value       = aws_security_group.ec2_security_group.id
}
