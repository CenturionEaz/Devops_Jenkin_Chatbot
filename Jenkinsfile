pipeline {
    agent any

    environment {
        GEMINI_API_KEY = credentials('gemini-api-key')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chatbot .'
            }
        }

        stage('Run Container') {
            steps {
                // Stop any old container
                sh 'docker stop chatbot-container || true'
                sh 'docker rm chatbot-container || true'

                // Run new one with API key
                sh '''
                docker run -d \
                  -p 5000:5000 \
                  --name chatbot-container \
                  -e GEMINI_API_KEY=$GEMINI_API_KEY \
                  chatbot
                '''
            }
        }
    }
}
