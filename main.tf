provider "aws" {
    region = "ap-northeast-2"
  
}

resource "aws_instance" "example" {
    ami           = "ami-0ff56409a6e8ea2a0"
    instance_type = "t2.micro"

}