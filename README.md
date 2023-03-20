# ALTSCHOOL THIRD SEMESTER CLOUD ENGINEER EXAMINATION
![socksApp](https://user-images.githubusercontent.com/105046475/226328133-93166771-9a74-4e82-b508-2541fb912afe.png)
#### This project was done with Kubernetes Cluster, Ansible, Terraform and AWS Cloud Provider.
### 1. Terraform.
I used terraform to provision and setup my infrastructure for this project. Which terraform provisioned instances on aws 
and output IPs for ansible to use as inventory to setup my **Kubeadm as kubernetes cluster**.
and I use ansible vault to encrypt my configMapMongodb.yml.
All this project was done on my custom terraform workspace **Prod** and I used and
