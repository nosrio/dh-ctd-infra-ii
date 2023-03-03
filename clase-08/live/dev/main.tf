module "vpc" {
    source = "../../modules/my-vpc"

    environment = var.environment
}


module "ec2" {
    source = "../../modules/my-ec2"

    environment = var.environment
    subnet_id   = module.vpc.subnet_id
}
