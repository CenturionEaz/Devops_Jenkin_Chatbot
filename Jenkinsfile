pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "chatbot"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Add test steps here, e.g., pytest or another testing framework
                    sh 'pytest tests/'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Add deployment steps here (e.g., push image to Docker registry)
                    sh 'docker run -d -p 5000:5000 ${DOCKER_IMAGE}'
                }
            }
        }
    }
}
