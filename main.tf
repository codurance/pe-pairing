
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_vpc" "thiagomotta" {
  cidr_block = "172.12.0.0/16"

  tags = local.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.thiagomotta.id

  tags = local.tags
}

resource "aws_subnet" "thiagomotta" {
  vpc_id     = aws_vpc.thiagomotta.id
  cidr_block = "172.12.0.0/24"

  tags = local.tags
}

resource "aws_route_table" "thiagomotta" {
  vpc_id = aws_vpc.thiagomotta.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "thiagomotta" {
  subnet_id      = aws_subnet.thiagomotta.id
  route_table_id = aws_route_table.thiagomotta.id
}

resource "aws_security_group" "thiagomotta" {
  name   = "allow_tls"
  vpc_id = aws_vpc.thiagomotta.id

  tags = local.tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.thiagomotta.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.thiagomotta.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "thiagomotta" {
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = aws_subnet.thiagomotta.id
  instance_type               = "t3.micro"
  security_groups             = [aws_security_group.thiagomotta.id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/nginx.sh") # check path

  tags = local.tags
}