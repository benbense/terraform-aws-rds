output "rds_endpoint" {
  description = "RDS Connection Endpoint"
  value       = aws_db_instance.postgres_db.endpoint
}
