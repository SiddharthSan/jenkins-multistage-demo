pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo '🔧 Building Docker image for inventory-api...'
                bat 'docker build -t inventory-api:latest -f Dockerfile .'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running container for testing...'
                bat '''
                docker run -d -p 5000:5000 --name inventory-api-test inventory-api:latest
                timeout /t 5
                curl http://localhost:5000
                docker stop inventory-api-test
                docker rm inventory-api-test
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Simulating deployment stage...'
                bat 'echo Deploying inventory-api to production environment...'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check the logs for errors.'
        }
    }
}
