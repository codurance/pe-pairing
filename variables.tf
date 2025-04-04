variable "name" {
  description = "The name of the VPC"
  type        = string
  default     = "vpc-main"

}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}

variable "enable_dns_support" {
  description = "CIDR block for the VPC"
  type        = bool
  default     = true

}

variable "enable_dns_hostnames" {
  description = "CIDR block for the VPC"
  type        = bool
  default     = true

}




