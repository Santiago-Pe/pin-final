variable "ami" {
  type        = string
  description = "ID de la AMI para la instancia EC2"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2"
}

variable "key_name" {
  type        = string
  description = "Nombre de la clave SSH"
}

variable "iam_instance_profile" {
  type        = string
  description = "Perfil de instancia de IAM"
}

variable "security_group_id" {
  type        = string
  description = "ID del grupo de seguridad"
}
