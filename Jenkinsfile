pipeline {
    agent any

    environment {
        devs = "seniorDevs"
    }

    stages {
        stage('Nginx Deployment and mongoDB') {
            steps {
                sshagent(['Admin1_SSH_Private_Key']){
                    sh "scp -o strictHostKeyChecking=no deployment.yaml ec2-user@54.210.230.177:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no secret.yml ec2-user@54.210.230.177:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no configMapMongodb.yml ec2-user@54.210.230.177:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no mongo.yaml ec2-user@54.210.230.177:/home/ec2-user"
                    sh "scp -o strictHostKeyChecking=no mongoExpress.yml ec2-user@54.210.230.177:/home/ec2-user"
                    script {
                        try{
                            sh "ssh ec2-user@54.210.230.177 kubectl create -f deployment.yaml"
                            sh "ssh ec2-user@54.210.230.177 kubectl create -f secret.yml"
                            sh "ssh ec2-user@54.210.230.177 kubectl create -f configMapMongodb.yml"
                            sh "ssh ec2-user@54.210.230.177 kubectl create -f mongo.yaml"
                            sh "ssh ec2-user@54.210.230.177 kubectl create -f mongoExpress.yml"
                        }catch(error) {
                            sh "ssh ec2-user@54.210.230.177 kubectl apply -f deployment.yaml"
                            sh "ssh ec2-user@54.210.230.177 kubectl apply -f secret.yml"
                            sh "ssh ec2-user@54.210.230.177 kubectl apply -f configMapMongodb.yml"
                            sh "ssh ec2-user@54.210.230.177 kubectl apply -f mongo.yaml"
                            sh "ssh ec2-user@54.210.230.177 kubectl apply -f mongoExpress.yml"
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
                        sh "scp -o strictHostKeyChecking=no complete-demo.yaml ec2-user@54.210.230.177:/home/ec2-user"
                        script {
                            try {
                                sh "ssh ec2-user@54.210.230.177 kubectl create -f complete-demo.yaml"
                            } catch(error) {
                                sh "ssh ec2-user@54.210.230.177 kubectl apply -f complete-demo.yaml"
                            }
                        }
                    }
                }
            }
        }
        stage('Prometheus and Granfana Deployment') {
            steps {
                dir('deploy/kubernetes/manifests-monitoring') {
                    sshagent(['Admin1_SSH_Private_Key']) {
                        sh "scp -o strictHostKeyChecking=no manifest-monitoring/*.yaml ec2-user@54.210.230.177:/home/ec2-user"

                        script {
                            try {
                                sh "ssh ec2-user@54.210.230.177 kubectl create -f 00-monitoring-ns.yaml"
                                // sh "ssh ec2-user@54.210.230.177 kubectl create $(ls *-prometheus-*.yaml | awk ' { print " -f " $1 } ')"
                                // sh "ssh ec2-user@54.210.230.177 kubectl create $(ls *-grafana-*.yaml | awk ' { print " -f " $1 }'  | grep -v grafana-import)"
                                // sh "ssh ec2-user@54.210.230.177 kubectl create -f 23-grafana-import-dash-batch.yaml"
                            } catch(error) {
                                sh "ssh ec2-user@54.210.230.177 kubectl apply -f 00-monitoring-ns.yaml"
                                // sh "ssh ec2-user@54.210.230.177 kubectl apply $(ls *-prometheus-*.yaml | awk ' { print " -f " $1 } ')"
                                // sh "ssh ec2-user@54.210.230.177 kubectl apply $(ls *-grafana-*.yaml | awk ' { print " -f " $1 }'  | grep -v grafana-import)"
                                // sh "ssh ec2-user@54.210.230.177 kubectl apply -f 23-grafana-import-dash-batch.yaml"
                            }
                        }
                    }
                }
            }
        }
    }
}