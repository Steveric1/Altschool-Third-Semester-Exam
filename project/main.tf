//import vpc from module "vpc"
module "vpc" {
  source          = "../modules/vpc"
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  public-1A_cidr  = var.public-1A_cidr
  public-1B_cidr  = var.public-1B_cidr
  public-1C_cidr  = var.public-1C_cidr
  private-1A_cidr = var.private-1A_cidr
  private-1B_cidr = var.private-1B_cidr
  private-1C_cidr = var.private-1C_cidr
  public1         = var.public1
  public2         = var.public2
  public3         = var.public3
  private1        = var.private1
  private2        = var.private2
  private3        = var.private3
  route           = var.route
  gate_way        = var.gate_way
}

//import security from module "SG"
module "security" {
  source = "../modules/SG"
  vpc_id = module.vpc.vpc_id
  name   = var.name
}

//provision an instance in public subnet for master
resource "aws_instance" "master" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = "us-east-1a"
  key_name                    = var.key_name
  subnet_id                   = module.vpc.public-1A
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.security.security_group_id]

  provisioner "local-exec" {
    command = "echo ${aws_instance.master.public_ip} >> inventory"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.master.public_ip
    private_key = file(var.key_pairs)
  }

  tags = {
    Name = "${terraform.workspace}-master"
  }
}

//provision an instance in public subnet for worker
# resource "aws_instance" "worker" {
#   ami                         = var.worker_ami
#   instance_type               = var.worker_instance_type
#   availability_zone           = "us-east-1b"
#   key_name                    = var.worker_key_name
#   subnet_id                   = module.vpc.public-1B
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [module.security.security_group_id]
# 
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.worker.public_ip} >> inventory"
#   }
# 
#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum update -y"
#     ]
#   }
# 
#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     host        = aws_instance.worker.public_ip
#     private_key = file(var.key_pairs)
#   }
# 
#   tags = {
#     Name = "${terraform.workspace}-worker"
#   }
# }

# resource "aws_instance" "worker2" {
#   ami                         = var.worker2_ami
#   instance_type               = var.worker2_instance_type
#   availability_zone           = "us-east-1c"
#   key_name                    = var.worker2_key_name
#   subnet_id                   = module.vpc.public-1C
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [module.security.security_group_id]
# 
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.worker2.public_ip} >> inventory"
#   }
# 
#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum update -y"
#     ]
#   }
# 
#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     host        = aws_instance.worker2.public_ip
#     private_key = file(var.key_pairs)
#   }
# 
#   tags = {
#     Name = "${terraform.workspace}-worker2"
#   }
# }

//print out my instance ip address
# resource "local_file" "inventory" {
#   filename = "inventory"
#   content = <<EOT 
#        [master]
#        ${aws_instance.master.public_ip}
#        [worker]
#        ${aws_instance.worker.public_ip}
#     EOT 
# }

