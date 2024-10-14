output "instance_ip" {
  value = module.ec2.instance_ip
}

output "private_key_path" {
  value = module.ssh_key.private_key_path
}
