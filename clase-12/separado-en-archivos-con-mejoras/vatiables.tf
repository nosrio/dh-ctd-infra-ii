# Agrego variables con el user y la password de la db

variable "db_user" {
    type = string
    description = "Root db username"
    default = "dbadmin"
}

variable "db_password" {
    type = string
    description = "Password for root user in db"
}
