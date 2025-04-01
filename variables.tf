variable "env" {
  type    = string
  default = "ivan-katzarski"
}

variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.100.100.0/24"
}
