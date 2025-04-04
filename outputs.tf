output "vpc_id" {
  description = "VPC Identifier"
  value       = module.vpc-main.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR Block"
  value       = module.vpc-main.cidr_block
}