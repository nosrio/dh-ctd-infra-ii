resource "aws_db_instance" "db" {
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.0.19"
    instance_class       = "db.t2.micro"
    name                 = "db"
    username             = "foo"
    password             = "foobarbaz"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = true
}
