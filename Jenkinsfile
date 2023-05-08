pipeline {
    agent any 
    
    environment {
        dockerImage =''
        registry = 'rohit19aug/rohit-user'
        registryCredential = 'dockerhub_id'
    }
    stages {
        stage('Building the Docker image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        stage('Uploading the image') {
            steps {
                script {
                   docker.withRegistry( '', registryCredential ) {
                       dockerImage.push()
                   } 
                }
            }
         stage('Creating deployment') {
                steps { 
                     kubeconfig(caCertificate: '/home/knoldus/.minikube/ca.crt', credentialsId: 'kubernetes', serverUrl: 'https://192.168.49.2:8443') {
              //          sh 'kubectl apply -f service.yml'
                        sh 'kubectl apply -f deployment.yml'
                    }  
                    }
            }
            stage('Creating service') {
                steps { 
                    kubeconfig(caCertificate: '/home/knoldus/.minikube/ca.crt', credentialsId: 'kubernetes', serverUrl: 'https://192.168.49.2:8443') {
                        sh 'kubectl apply -f service.yml'
                        // sh 'kubectl apply -f deployment.yml'
                    }  
                }
            }
        }
    }
}
