terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_security_group" "my-sg" {
  name        = "JENKINS-SERVER-SG"
  description = "Jenkins Server Ports"
  vpc_id      = module.vpc.vpc_id 
  
  
  
  ingress {
    description     = "SSH Port"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }

  
  ingress {
    description     = "HTTP Port"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress {
    description     = "HTTPS Port"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "etc-cluster Port"
    from_port       = 2379
    to_port         = 2380
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  


  ingress {
    description     = "grafana port"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  ingress {
    description     = "Kube API Server"
    from_port       = 6443
    to_port         = 6443
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  ingress {
    description     = "Jenkins Port"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  ingress {
    description     = "SonarQube Port"
    from_port       = 9000
    to_port         = 9000
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  ingress {
    description     = "Prometheus Port"
    from_port       = 9090
    to_port         = 9090
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  ingress {
    description     = "Prometheus Metrics Port"
    from_port       = 9100
    to_port         = 9100
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  } 


  ingress {
    description     = "K8s Ports"
    from_port       = 10250
    to_port         = 10260
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  ingress {
    description     = "K8s NodePort"
    from_port       = 30000
    to_port         = 32767
    protocol        = "tcp"
    cidr_blocks = var.allowed_ips
  }  

  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "my-ec2" {
  ami           = var.ami   
  instance_type = var.instance_type
  key_name      = var.key_name       
  subnet_id     = module.vpc.public_subnets[0]
  associate_public_ip_address = true 
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  
  
  root_block_device {
    volume_size = var.volume_size
  }
  
  tags = {
    Name = var.server_name
  }
  
  provisioner "file" {
    source      = "script.sh"
    destination = "/home/ubuntu/setup.sh"
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./microservicesProject.pem")
    host        = self.public_ip
  }
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./microservicesProject.pem")
      host        = self.public_ip
    }
     inline = [
      # make it executable…
      "chmod +x /home/ubuntu/setup.sh",
      # …then detach it fully (< /dev/null, &), and exit the shell immediately
      "nohup sudo /home/ubuntu/setup.sh > /home/ubuntu/setup.log 2>&1 < /dev/null &",
      "exit 0",
    ]
  }
  
}  