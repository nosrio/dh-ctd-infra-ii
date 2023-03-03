output "vpc_id" {
  value       = aws_vpc.main.id
  description = "AWS VPC id"
}

output "subnet_id" {
  value       = aws_subnet.main.id
  description = "AWS subnet id."
}

