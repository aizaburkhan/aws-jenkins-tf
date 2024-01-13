data "aws_ami" "ami_filter" {
  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  most_recent = true
  owners      = ["137112412989"]
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ami_filter.id
  instance_type   = var.instance_type_t2large
  key_name        = aws_key_pair.key.key_name
  security_groups = [aws_security_group.allow_tls.id]
  subnet_id       = aws_subnet.sb1.id

  tags = {
    Name = "group4-ec2"
  }

  connection {
    host        = element(aws_instance.web[*].public_ip, 0)
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "file" {
    source      = "./jenkinsRun.sh"
    destination = "./jenkinsRun.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ./jenkinsRun.sh",
      "sh ./jenkinsRun.sh"
    ]
  }
}