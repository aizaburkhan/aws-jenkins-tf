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

# resource "aws_instance" "web" {
#   ami             = data.aws_ami.ami_filter.id
#   instance_type   = var.instance_type_t2large
#   key_name        = aws_key_pair.key.key_name
#   security_groups = [aws_security_group.allow_tls.id]
#   subnet_id       = aws_subnet.sb1.id

#   tags = {
#     Name = "group4-ec2"
#   }

#   connection {
#     host        = element(aws_instance.web[*].public_ip, 0)
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("~/.ssh/id_rsa")
#   }

#   provisioner "file" {
#     source      = "./jenkinsRun.sh"
#     destination = "./jenkinsRun.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x ./jenkinsRun.sh",
#       "sh ./jenkinsRun.sh"
#       # "sudo mkdir AK"
#     ]
#   }
# }

# resource "null_resource" "cluster" {
#   # triggers = {
#   #   always_run = "${timestamp()}"
#   # }
#   connection {
#     host = element(aws_instance.web[*].public_ip, 0)
#     type = "ssh"
#     user = "ec2-user"
#     private_key = file("~/.ssh/id_rsa")
#   }
#  provisioner "remote-exec" {
#     inline = [
#       "chmod +x ./jenkinsRun.sh", 
#       "bash ./jenkinsRun.sh", 
#     ]

#      }
#     # depends_on = [ time_sleep.wait_300_seconds ]
# }


# resource "time_sleep" "wait_300_seconds" {
#   create_duration = "300s"
#   # depends_on = [ aws_instance.web ]
# }

# resource "terraform_data" "StrictHostKeyCheckingFalse" {
#   provisioner "local-exec" {
#     command = "ssh -o StrictHostKeyChecking=no ec2-user@${aws_instance.web.public_ip}"
#    }
#     depends_on = [ time_sleep.wait_60_seconds ]
# }

# resource "terraform_data" "exitSSH" {
#   provisioner "local-exec" {
#     command = "exit"
#    }
#     depends_on = [ terraform_data.StrictHostKeyCheckingFalse ]
# }

# resource "terraform_data" "copyJenkinsToNewEC2" {
#   provisioner "local-exec" {
#     command = "scp ${"jenkinsRun.sh"} ec2-user@${aws_instance.web.public_ip}:"
#    }
#     depends_on = [ terraform_data.StrictHostKeyCheckingFalse]
# }

# resource "terraform_data" "executeJenkinsFile" {
#   provisioner "local-exec" {
#     command = "ssh ec2-user@${aws_instance.web.public_ip} bash jenkinsRun.sh"
#    }
#    depends_on = [ terraform_data.copyJenkinsToNewEC2]
# }

# resource "null_resource" "executeJenkinsFile" {
#   provisioner "local-exec" {
#     command = <<EOT
#       "ssh -o StrictHostKeyChecking=no ec2-user@${aws_instance.web.public_ip}"
#       "exit"
#       "scp ${"jenkinsRun.sh"} ec2-user@${aws_instance.web.public_ip}:"
#       "ssh ec2-user@${aws_instance.web.public_ip} bash jenkinsRun.sh"
#     EOT
#   }
#   depends_on = [time_sleep.wait_300_seconds]
# }

