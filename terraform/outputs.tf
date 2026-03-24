output "instance_public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.devops_server.public_ip
}
