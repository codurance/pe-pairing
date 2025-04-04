output "vpc_id" {
  description = "VPC Identifier"
  value = aws_vpc.vpc-main.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR Block"
  value = aws_vpc.vpc-main.cidr_block
}