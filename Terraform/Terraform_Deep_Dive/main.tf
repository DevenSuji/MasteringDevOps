provider "aws" {
  region = "ap-south-1"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default = 8080
}


resource "aws_instance" "learning_terraform_1" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]


  user_data = <<-EOF
              #!/bin/bash
              echo "This is probably the last time you are getting to study.\nThere are a lot of issues at home which can be resolved only if you study CONSISTENTLY and complete the EXTERNAL CERTIFICATIONS.\nPavithra needs to leave her job.\nI want 20 acres of agricultural land.\nI want to gift a nice car and a house to my daughter in her wedding.\nI want to create some wealth for my son.\nI want a house built inside my 20 acre land.\n\nIn order to achieve all this, I need to STUDY HARD and STUDY CONSISTENTLY and this is the only option I have!!!" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF


  tags = {
    Name = "daylinansp001"
  }
}
resource "aws_security_group" "instance" {
  name = "webserver-access"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webserver-access"
  }
}

output "public_ip" {
  value       = aws_instance.learning_terraform_1.public_ip
  description = "The public IP address of the web server"
}