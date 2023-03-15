## En lugar de crear una VPC y una Subnet, las importo como datasourcers

# resource "aws_vpc" "vpc" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "vpc"
#   }
# }

data "aws_vpc" "vpc" {
  default = true
  
  filter {
    name = "tag:Name"
    values = ["vpc"]
  }
}

# resource "aws_subnet" "subnet" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "subnet"
#   }

# }

data "aws_subnet" "subnet" {

  vpc_id     = data.aws_vpc.vpc.id
  
  filter {
    name = "tag:Name"
    values = ["subnet"]
  }
}
