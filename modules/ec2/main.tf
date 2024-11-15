resource "aws_instance" "ec2_instance" {
  count             = var.instance_count
  ami               = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  user_data         = var.user_data
  vpc_security_group_ids = var.security_groups  # Correct attribute to assign security groups

  tags = {
    Name = "ec2_instance"
  }
}
