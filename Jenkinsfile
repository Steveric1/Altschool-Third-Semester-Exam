pipeline {
    agent any

    environment {
        devs = "seniorDevs"
    }

    stages {
        stage('Nginx Deployment and mongoDB') {
            steps {
                sshagent(['Admin1_SSH_Private_Key']){
                    sh "scp -o strictHostKeyChecking=no deployment.yaml ubuntu@3.80.103.142:/home/ubuntu"
                    sh "scp -o strictHostKeyChecking=no secret.yml ubuntu@3.80.103.142:/home/ubuntu"
                    sh "scp -o strictHostKeyChecking=no configMapMongodb.yml ubuntu@3.80.103.142:/home/ubuntu"
                    sh "scp -o strictHostKeyChecking=no mongo.yaml ubuntu@3.80.103.142:/home/ubuntu"
                    sh "scp -o strictHostKeyChecking=no mongoExpress.yml ubuntu@3.80.103.142:/home/ubuntu"
                    script {
                        try{
                            sh "ssh ubuntu@3.80.103.142 kubectl create -f deployment.yaml"
                            sh "ssh ubuntu@3.80.103.142 kubectl create -f secret.yml"
                            sh "ssh ubuntu@3.80.103.142 kubectl create -f configMapMongodb.yml"
                            sh "ssh ubuntu@3.80.103.142 kubectl create -f mongo.yaml"
                            sh "ssh ubuntu@3.80.103.142 kubectl create -f mongoExpress.yml"
                        }catch(error) {
                            sh "ssh ubuntu@3.80.103.142 kubectl apply -f deployment.yaml"
                            sh "ssh ubuntu@3.80.103.142 kubectl apply -f secret.yml"
                            sh "ssh ubuntu@3.80.103.142 kubectl apply -f configMapMongodb.yml"
                            sh "ssh ubuntu@3.80.103.142 kubectl apply -f mongo.yaml"
                            sh "ssh ubuntu@3.80.103.142 kubectl apply -f mongoExpress.yml"
                        }
                    }
                }
            }
        }
        stage('git clone socks app') {
            steps {
                git branch: 'master', url: 'https://github.com/Steveric1/microservices-demo.git'
            }
        }
        stage('Socks App Deployment'){
            steps {
                dir('deploy/kubernetes') {
                    sshagent(['Admin1_SSH_Private_Key']) {
                        sh "scp -o strictHostKeyChecking=no complete-demo.yaml ubuntu@3.80.103.142:/home/ubuntu"
                        script {
                            try {
                                sh "ssh ubuntu@3.80.103.142 kubectl create -f complete-demo.yaml"
                            } catch(error) {
                                sh "ssh ubuntu@3.80.103.142 kubectl apply -f complete-demo.yaml"
                            }
                        }
                    }
                }
            }
        }
        stage('Prometheus and Granfana Deployment') {
            steps {
                dir('deploy/kubernetes') {
                    sshagent(['Admin1_SSH_Private_Key']) {
                        sh "scp -o strictHostKeyChecking=no -r manifests-monitoring ubuntu@3.80.103.142:/home/ubuntu"

                        script {
                            try {
                                sh "ssh ubuntu@3.80.103.142 kubectl create -f manifests-monitoring/00-monitoring-ns.yaml"
                            } catch(error) {
                                sh "ssh ubuntu@3.80.103.142 kubectl apply -f manifests-monitoring/00-monitoring-ns.yaml"
                            }
                        }
                    }
                }
            }
        }
        stage('ingress-nginx deployment') {
            steps{
               sshagent(['Admin1_SSH_Private_Key']) {
                    sh "scp -o strictHostKeyChecking=no ingress.yaml ubuntu@3.80.103.142:/home/ubuntu"

                    script {
                        try {
                            sh "ssh ubuntu@3.80.103.142 kubectl create -f ingress.yaml"
                        } catch(error) {
                            sh "sh ubuntu@3.80.103.142 kubectl apply -f ingress.yaml"
                        }
                    }
               } 
            }
        }
    }
}