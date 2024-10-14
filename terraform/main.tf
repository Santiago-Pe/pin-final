provider "aws" {
  region = "us-east-1"
}

module "ssh_key" {
  source   = "./modules/ssh_key"
  key_name = "pin"
}

# Check
module "security_group" {
  source         = "./modules/security_group"
  allowed_ssh_ips = ["0.0.0.0/0"]
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source               = "./modules/ec2"
  ami                  = "ami-0866a3c8686eaeeba"
  instance_type        = "t2.micro"
  key_name             = module.ssh_key.key_name
  iam_instance_profile = module.iam.instance_profile_name
  security_group_id    = module.security_group.security_group_id
}