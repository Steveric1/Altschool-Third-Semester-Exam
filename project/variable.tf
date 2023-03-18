//vpc variable declaration
variable "vpc_cidr" { type = string }
variable "vpc_name" {
  type    = string
  default = "prod"
}

variable "public-1A_cidr" { type = string }
variable "public-1B_cidr" { type = string }
variable "public-1C_cidr" { type = string }
variable "private-1A_cidr" { type = string }
variable "private-1B_cidr" { type = string }
variable "private-1C_cidr" { type = string }

variable "public1" {
  type    = string
  default = "prod"
}
variable "public2" {
  type    = string
  default = "prod"
}
variable "public3" {
  type    = string
  default = "prod"
}
variable "private1" {
  type    = string
  default = "prod"
}
variable "private2" {
  type    = string
  default = "prod"
}
variable "private3" {
  type    = string
  default = "prod"
}
variable "route" {
  type    = string
  default = "prod"
}
variable "gate_way" {
  type    = string
  default = "prod"
}

//security group variable declaration
variable "web_ingress" {
  type = map(object({
    description = string
    fromPort    = number
    toPort      = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = {
    "http" = {
      description = "HTTP"
      fromPort    = 80
      toPort      = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "https" = {
      description = "HTTPS"
      fromPort    = 443
      toPort      = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "ssh" = {
      description = "SSH"
      fromPort    = 22
      toPort      = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "6443" = {
      description = "Kubernetes API"
      fromPort    = 6443
      toPort      = 6443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "2379 - 2380" = {
      description = "etcd"
      fromPort    = 2379
      toPort      = 2380
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "10251" = {
      description = "kubelet"
      fromPort    = 10251
      toPort      = 10251
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "10252" = {
      description = "kube-controller-manager"
      fromPort    = 10252
      toPort      = 10252
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "30000 - 32767" = {
      description = "NodePort Services"
      fromPort    = 30000
      toPort      = 32767
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "name" {
  type    = string
  default = "prod"
}

//instance variable declaration for master node 
variable "ami" { type = string }
variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "key_pairs" { type = string }

//instance variable declaration for worker node
# variable "worker_ami" { type = string }
# variable "worker_instance_type" { type = string }
# variable "worker_key_name" { type = string }

//instance variable declaration for worker node
# variable "worker2_ami" { type = string }
# variable "worker2_instance_type" { type = string }
# variable "worker2_key_name" { type = string }
# 
