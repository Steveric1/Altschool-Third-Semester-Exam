variable "web_ingress" {
  type = map(object({
    description = string
    fromPort   = number
    toPort    = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = {
    "http" = {
      description = "HTTP"
      fromPort        = 80
      toPort = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "https" = {
      description = "HTTPS"
      fromPort        = 443
      toPort = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "ssh" = {
      description = "SSH"
      fromPort        = 22
      toPort = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "6443" = {
      description = "Kubernetes API"
      fromPort        = 6443
      toPort = 6443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "2379 - 2380" = {
      description = "etcd"
      fromPort        = 2379
      toPort =  2380
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "10251" = {
      description = "kubelet"
      fromPort        = 10251
      toPort = 10251
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "10252" = {
      description = "kube-controller-manager"
      fromPort        = 10252
      toPort = 10252
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    "30000 - 32767" = {
      description = "NodePort Services"
      fromPort        = 30000 
      toPort = 32767
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    8472 - 8472 = {
      description = "flannel"
      fromPort        = 8472
      toPort = 8472
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "vpc_id" {}
variable "name" {}