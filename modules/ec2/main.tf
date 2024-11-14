resource "aws_instance" "nginx_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu AMI in ap-south-1
  instance_type = "t3.micro"
  count         = var.instance_count
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [var.ec2_security_group]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              EOF
}
