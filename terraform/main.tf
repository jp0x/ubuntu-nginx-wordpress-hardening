provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "wordpress" {
  ami           = "ami-xxxxxxxxxxxx"  # Aquí va la AMI de Bitnami WordPress.
  instance_type = "t2.micro"
  key_name      = "your-ssh-key-name"  # Reemplaza con el nombre de tu clave SSH

  tags = {
    Name = "WordPress Instance"
  }
}

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Security group for WordPress"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
