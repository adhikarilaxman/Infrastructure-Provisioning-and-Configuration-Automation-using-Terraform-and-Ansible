# -----------------------------
# Provider
# -----------------------------
provider "aws" {
  region = var.aws_region
}

# -----------------------------
# Fetch Default VPC
# -----------------------------
data "aws_vpc" "default" {
  default = true
}

# -----------------------------
# Fetch Subnets in Default VPC
# -----------------------------
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# -----------------------------
# Security Group
# -----------------------------
resource "aws_security_group" "devops_sg" {
  name        = "devops_sg"
  description = "Allow SSH and HTTP"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DevOps-SG"
  }
}

# -----------------------------
# EC2 Instance
# -----------------------------
resource "aws_instance" "devops_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "DevOps-Server"
  }
}

# -----------------------------
# Dynamic Inventory for Ansible
# -----------------------------
resource "local_file" "ansible_inventory" {
  content = <<EOT
[web]
${aws_instance.devops_server.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${var.private_key_path}
EOT

  filename = "../ansible/inventory.ini"
}
