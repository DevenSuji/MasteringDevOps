provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-08198662331cf1a51"
  instance_type = "t2.micro"
  tags = {
    Name        = "webserver"
    Description = "An nginx webserver on AWS Amazon EC2"
  }
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "learning-terraform-state-12262021"
    key            = "workspaces-example/terraform.tfstate"
    region         = "ap-south-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "learning-terraform-state-12262021-locks"
    encrypt        = true
  }
}