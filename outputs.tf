output "vpc_id" {
  description = "VPC Identifier"
  value       = module.vpc-main.vpc_id
}

output "vpc_cidr_block" {
  description = "VPC CIDR Block"
  value       = module.vpc-main.vpc_cidr_block
}
