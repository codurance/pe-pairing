resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-2"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_instance" "foo" {
  ami                         = "ami-005e54dee72cc1d00" # us-west-2
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.my_subnet.id

  user_data = <<EOF

    #!/bin/bash

    yum update –y 
    amazon-linux-extras install nginx1.12
    nginx -v
    systemctl start nginx
    systemctl enable nginx
    chmod 2775 /usr/share/nginx/html 
    find /usr/share/nginx/html -type d -exec chmod 2775 {} \;
    find /usr/share/nginx/html -type f -exec chmod 0664 {} \;
    echo "<h3> Welcome to my NGINX web server! User data instillation was a SUCCESS! </h3>" > /usr/share/nginx/html/index.html

  EOF


}