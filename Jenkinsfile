pipeline {
    agent any

    environment {
        devs = "seniorDevs"
    }

    stages {
        stage('Nginx Deployment and mongoDB') {
            steps {
                sshagent(['Admin1_SSH_Private_Key']){
                    sh "scp -o strictHostKeyChecking=no deployment.yaml ec2-user@3.80.103.136:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no secret.yml ec2-user@3.80.103.136:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no configMapMongodb.yml ec2-user@3.80.103.136:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no mongo.yaml ec2-user@3.80.103.136:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no mongoExpress.yml ec2-user@3.80.103.136:/home/ec2-user"
                    script {
                        try{
                            sh "ssh ec2-user@3.80.103.136 kubectl create -f deployment.yaml"
                            sh "ssh ec2-user@3.80.103.136 kubectl create -f secret.yml"
                            sh "ssh ec2-user@3.80.103.136 kubectl create -f configMapMongodb.yml"
                            sh "ssh ec2-user@3.80.103.136 kubectl create -f mongo.yaml"
                            sh "ssh ec2-user@3.80.103.136 kubectl create -f mongoExpress.yml"
                        }catch(error) {
                            sh "ssh ec2-user@3.80.103.136 kubectl apply -f deployment.yaml"
                            sh "ssh ec2-user@3.80.103.136 kubectl apply -f secret.yml"
                            sh "ssh ec2-user@3.80.103.136 kubectl apply -f configMapMongodb.yml"
                            sh "ssh ec2-user@3.80.103.136 kubectl apply -f mongo.yaml"
                            sh "ssh ec2-user@3.80.103.136 kubectl apply -f mongoExpress.yml"
                        }
                    }
                }
            }
        }
        stage('Socks App Deployment'){
            steps {
                dir('deploy/kubernetes') {
                    sshagent(['Admin1_SSH_Private_Key']) {
                        sh "scp -o strictHostKeyChecking=no complete-demo.yaml ec2-user@3.80.103.136:/home/ec2-user"
                        script {
                            try {
                                sh "ssh ec2-user@3.80.103.136 kubectl create -f complete-demo.yaml"
                            } catch(error) {
                                sh "ssh ec2-user@3.80.103.136 kubectl apply -f complete-demo.yaml"
                            }
                        }
                    }
                }
            }
        }
    }
}