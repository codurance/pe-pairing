output "nginx_instance_public_ip" {
  description = "Public IP of the NGINX instance"
  value       = aws_instance.nginx.public_ip
}

output "private_key" {
  description = "The private key needed to SSH into the NGINX instance."
  value       = tls_private_key.main.private_key_pem
  # sensitive   = true
}
