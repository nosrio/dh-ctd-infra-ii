data "aws_availability_zones" "available" {}    # Me trae las Zonas de Disponibilidad (AZs)


# Crear una VPC.
# Definir el nombre de dicha VPC.
# Crear un Internet Gateway y un NAT Gateway.
# Dos subnets públicas y dos subnets privadas.
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.namespace}-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  create_igw         = true

  tags = {
    Terraform = "true"
    Environment = "dev"
    Owner       = "nicolas.osorio@digitalhouse.com"
  }
}


# Crear dos grupos de seguridad con los siguientes accesos, uno de acceso público y otro privado.
resource "aws_security_group" "allow_ssh_pub" {
 name        = "${var.namespace}-allow_ssh-pub"
 description = "Allow SSH inbound traffic"
 vpc_id      = module.vpc.vpc_id


 ingress {
   description = "SSH from the internet"
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }


 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }


 tags = {
    Terraform = "true"
    Environment = "dev"
    Owner       = "nicolas.osorio@digitalhouse.com"
    Name = "${var.namespace}-allow_ssh_pub"
 }
}


resource "aws_security_group" "allow_ssh_priv" {
 name        = "${var.namespace}-allow_ssh-priv"
 description = "Allow SSH inbound traffic from private subnet"
 vpc_id      = module.vpc.vpc_id


 ingress {
   description = "SSH from the internet"
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = module.vpc.private_subnets_cidr_blocks
 }


 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }


 tags = {
    Terraform = "true"
    Environment = "dev"
    Owner       = "nicolas.osorio@digitalhouse.com"
    Name = "${var.namespace}-allow_ssh_pub"
 }

}
