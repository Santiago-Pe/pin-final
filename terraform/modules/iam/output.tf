output "instance_profile_name" {
  description = "Nombre del perfil de instancia de IAM"
  value       = aws_iam_instance_profile.ec2_instance_profile.name
}
