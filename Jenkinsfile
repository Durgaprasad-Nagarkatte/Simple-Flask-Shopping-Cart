pipeline {
    agent any 
    
    environment {
        dockerImage =''
        registry = 'rohit19aug/rohit-user'
        registryCredential = 'dockerhub_id'
    }
    stages {
        //stage('Checkout') {
        //    steps {
            //    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rohit-19-aug/Simple-Flask-Shopping-Cart.git']])
         //   }
       // }
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
        }
    }
}
