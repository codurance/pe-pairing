variable "env" {
  type    = string
  default = "ivan-katzarski"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-vpc"
  }
}
