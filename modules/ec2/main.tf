resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  user_data = var.user_data

  tags = {
    Name = "web-server-${count.index}"
  }
}