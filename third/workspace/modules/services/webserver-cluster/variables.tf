variable "server_port" {
    description = "The port the server will use for HTTP request"
    type        = number
    default = 8080
  
}

variable "cluster_name" {
    description = "The name to use for all the cluster rsources"
    type = string
}

variable "db_remote_state_bucket" {
    description = "The name of the S3 bucket for the database's remote state"
    type = string
}

variable "db_remote_state_key" {
    description = "The path for the database's remote state in S3"
    type = string
}

variable "instance_type" {
    description = "The type of EC2 Instances to run (e.g. t2.micro)"
    type = string
}

variable "min_size" {
    description = "The minimum number of EC2 Instances in the ASG"
    type = number
}

variable "max_size" {
    description = "The maximum number of EC2 Instances in the ASG"
    type = number
}

output "address" {
    value = aws_db_instance.example.address
    description = "Connect to the database at this endpoint"
}

output "port" {
    value = aws_db_instance.example.port
    description = "The port the database is listening on"
}




