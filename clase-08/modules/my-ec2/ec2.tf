data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name    = "name"
    values  = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"]
  }
}


resource "aws_instance" "instance" {
  ami             = data.aws_ami.ubuntu.id 
  instance_type   = local.instance_type
  subnet_id       = var.subnet_id

  tags = { 
      Name = "terraform-ec2"
      environment = var.environment
  }
  
}
