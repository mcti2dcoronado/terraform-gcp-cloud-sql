resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "random_password" "pwd" {

  length = 16
  special = false
}

resource "google_sql_database_instance" "mysql_server" {
 
  name             = "mysql-instance-${random_id.db_name_suffix.hex}"
  project	   = "montreal-project-mcit"
  region           = "northamerica-northeast1-a"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
  }
  
  # set to true to prevent destruction of the resource
  deletion_protection = false 
  
}

resource "google_sql_user" "users" {

  name		= "root"
  instance	= "${google_sql_database_instance.mysql_server.name}"
  password	= random_password.pwd.result

}
