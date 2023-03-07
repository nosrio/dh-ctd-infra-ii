# VPC ID

output "vpc_name" {
    value   = module.vpc.name
}

output "security_group_public_name" {
    value  = aws.aws_security_group.allow_ssh_pub.name
}
