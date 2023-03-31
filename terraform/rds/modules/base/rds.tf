resource "aws_db_instance" "default" {
  allocated_storage     = 30
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  name                  = "${var.name}-mysql"
  username              = var.username
  password              = var.password
  parameter_group_name  = "default.mysql8.0"
  skip_final_snapshot   = true
  max_allocated_storage = 100
}
