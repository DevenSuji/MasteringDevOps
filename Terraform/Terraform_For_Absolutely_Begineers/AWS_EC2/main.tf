resource "aws_instance" "webserver" {
  ami           = "ami-08198662331cf1a51"
  instance_type = "t2.micro"
  tags {
    Name        = "webserver"
    Description = "An nginx webserver on AWS EC2 Ubuntu"
  }
  provisioner "remote-exec" {
    inline = [
      "yum update -y",
      "yum install nginx -y",
      "systemctl enable nginx",
      "systemctl start nginx"
    ]
  }
  connection {
    type     = "ssh"
    host = self.public_ip
    user     = "ec2-user"
    password = file("/root/c:/users/desuji2001/downloads/web")
  }


  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_key_pair" "web" {
  public_key = file("c:/users/desuji2001/dowloads/web.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Enable access to SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
output "publicip" {
  value = aws_instance.webserver.public_ip
}

