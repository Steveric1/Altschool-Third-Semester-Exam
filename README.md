# ALTSCHOOL THIRD SEMESTER CLOUD ENGINEER EXAMINATION
![socksApp](https://user-images.githubusercontent.com/105046475/226328133-93166771-9a74-4e82-b508-2541fb912afe.png)
#### This project was done with Kubernetes Cluster, Ansible, Terraform and AWS Cloud Provider.
### 1. Terraform.
I used terraform to provision and setup my infrastructure for this project. Which terraform provisioned instances on aws 
and output IPs for ansible to use as inventory to setup my **Kubeadm as kubernetes cluster**.

And I use **ansible vault** to encrypt my configMapMongodb.yml.

All this project was done on my custom terraform workspace **Prod** and I use **ansible vault** to encrypt my Terraformtfstate file. 
my **terraformtfstate file** is inside my **terraform.tfstate.d folder** all inside my **project folder**.

### 2. Challenges
After setting up my cluster and using Jenkinsfile pipeline to deploy my socks application and my web application, so I had issue with  **Nginx Ingress Controller**
on the **Kubeadm Cluster** to setup my domain name which now made me to do more research on alternative Kubernetes cluster bootstrapping tools.

### 3. Kops Cluster
I use terraform to setup the Kubernetes Cluster. And I deploy my web application and socks application to the cluster

For my web application I use **Nginx Web Server** and I containerize my landing page web application using nginx server as my **base image**. 

![Landing page ](https://user-images.githubusercontent.com/105046475/226328233-838721cb-2847-483a-8c33-7a3b51d9774f.png)
My landing page application as four buttons
1. Socks-Webapp -> link to the socks web applications.
2. Mongo-Database -> link to the mongo database using mongoExpress as the frontend.
3. Prometheus -> link to promtheus web applications.
4. Grafana -> link to grafana web applications.

### 4. Jenkins
I wrote a Jenkinsfile pipeline for my continuous integration and my continuous deployment **CICD**.
