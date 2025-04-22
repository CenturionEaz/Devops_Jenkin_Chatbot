pipeline {
    agent any

    environment {
        GEMINI_API_KEY = credentials('gemini-api-key') // Add this in Jenkins credentials
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chatbot_project .'
            }
        }

        stage('Stop and Remove Previous Container') {
            steps {
                sh 'docker stop chatbot_container || true'
                sh 'docker rm chatbot_container || true'
            }
        }

        stage('Run Container') {
            steps {
                sh """
                docker run -d --name chatbot_container \
                -p 5000:5000 \
                -e GEMINI_API_KEY=$GEMINI_API_KEY \
                chatbot_project
                """
            }
        }
    }
}
