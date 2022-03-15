resource "aws_db_instance" "postgres_db" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.db_identifier_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.rds_postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true
  db_name                = "kandula"
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "${var.db_identifier_name}_subnet_group"
  description = "${var.db_identifier_name} Subnet Group"
  subnet_ids  = flatten(var.subnets_ids)
}

resource "aws_security_group" "rds_postgres" {
  name        = "${var.db_identifier_name}_sg"
  description = "Security group for ${var.db_identifier_name} Postgres RDS"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    iterator = port
    for_each = var.rds_ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_route53_record" "postgres_rds" {
  zone_id = var.route53_zone_id
  name    = "rds.kandula"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_db_instance.postgres_db.address}"]
}
