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

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.100.100.0/24"

  tags = {
    Name = "${var.env}-public-subnet"
  }
}
