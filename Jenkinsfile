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
            when {
                branch "Production"
            }
            steps {
                script {
                   docker.withRegistry( '', registryCredential ) {
                       dockerImage.push()
                   } 
                }
            }
        }
    }
}
