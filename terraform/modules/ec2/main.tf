resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile = var.iam_instance_profile
  user_data            = file("${path.module}/install-deps.sh")

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "EC2-instance-pin"
  }
}
