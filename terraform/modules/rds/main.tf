# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project}-${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project}-${var.environment}-db-subnet-group"
  }
}

# RDS Parameter Group
resource "aws_db_parameter_group" "main" {
  name   = "${var.project}-${var.environment}-db-params"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "max_connections"
    value = "100"
  }

  tags = {
    Name = "${var.project}-${var.environment}-db-params"
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "main" {
  identifier        = "${var.project}-${var.environment}-rds"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.db_instance_class
  allocated_storage = 20
  storage_type      = "gp2"
  storage_encrypted = false

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_security_group_id]

  multi_az               = false
  publicly_accessible    = false
  skip_final_snapshot    = true
  deletion_protection    = false

  backup_retention_period = 0
  
  auto_minor_version_upgrade = true

  parameter_group_name = aws_db_parameter_group.main.name

  tags = {
    Name = "${var.project}-${var.environment}-rds"
  }
}
