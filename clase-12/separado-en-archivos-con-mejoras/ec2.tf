## Uso datasources en lugar de los recursos

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.subnet.id

  tags = {
    Name = "Frontend"
  }
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.subnet.id

  tags = {
    Name = "Backend"
  }
}
