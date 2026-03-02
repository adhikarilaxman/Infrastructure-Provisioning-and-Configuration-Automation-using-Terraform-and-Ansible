variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID (Mumbai region)"
  type        = string
  default     = "ami-03f4878755434977f"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
  default     = "Test-EC2"
}

variable "private_key_path" {
  description = "Path to private SSH private key"
  type        = string
  default     = "~/.ssh/mykey.pem"
}

variable "allowed_ip" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0" # Change to YOUR_IP/32 for security
}
