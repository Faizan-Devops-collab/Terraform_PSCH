##launch an EC2 instance with web server.

##the most recent ubuntu AMI image.
##launching an EC2 instance inside a custom VPC in public subnet with public IP associated

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
   ami           = data.aws_ami.ubuntu.id
   instance_type = var.instance_type
   vpc_security_group_ids      = [var.web_security_group_id]
   subnet_id = var.public_subnet_id
   associate_public_ip_address = true

##running the meta data and connecting to DB
   user_data = templatefile("${path.module}/templates/user_data.sh", {
    db_host     = var.db_host
    db_username = var.db_username
    db_password = var.db_password
    db_name     = var.db_name
  })

  tags = {
    Name = "${var.project_name}-web-Server"
    Environment = var.environment
  }
}

