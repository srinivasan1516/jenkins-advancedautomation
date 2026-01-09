pipeline {
    agent any

    environment {
        NODE_ENV = "production"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-repo.git',
                    credentialsId: 'github-creds'
            }
        }

        stage('Build') {
            steps {
                sh '''
                  node -v
                  npm -v
                  cd backend
                  npm install
                '''
            }
        }

        stage('Deploy New Version') {
            steps {
                sh '''
                  chmod +x scripts/deploy.sh
                  cd scripts
                  ./deploy.sh
                '''
            }
        }

        stage('Switch Traffic') {
            steps {
                sh '''
                  chmod +x scripts/switch.sh
                  cd scripts
                  ./switch.sh
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful"
        }
        failure {
            echo "❌ Deployment failed! Rollback manually if required."
        }
    }
}
