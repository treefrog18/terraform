provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_db_instance" "example" {
    identifier_prefix = "terraform-up-and-running"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    name = "example_database"
    username = "admin"

    password = var.db_password
}


terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-945872"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "ap-northeast-2"

    dynamodb_table = "terrraform-up-and-running-locks"
    encrypt = true
  }
}


# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }