pipeline {
    agent any

    stages {
        stage('Pull latest code') {
            steps {
                git 'https://github.com/CenturionEaz/Devops_Jenkin_Chatbot'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chatbot_image .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Stop previous container if running
                sh '''
                docker stop chatbot_container || true
                docker rm chatbot_container || true
                docker run -d --name chatbot_container -p 5000:5000 --env-file .env chatbot_image
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}
