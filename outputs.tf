output "rds_endpoint" {
  description = "RDS Connection Endpoint"
  value       = aws_db_instance.postgres_db.endpoint
}

output "rds_address" {
  description = "RDS Host address"
  value       = aws_db_instance.postgres_db.address
}

output "rds_port" {
  description = "RDS Port"
  value       = aws_db_instance.postgres_db.port
}

output "db_password" {
  description = "RDS Password"
  value = random_password.password.result
  sensitive = true
}