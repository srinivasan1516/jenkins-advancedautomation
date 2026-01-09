pipeline {
  agent any

  environment {
    APP_DIR = "/var/lib/jenkins/workspace/blue-green"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/srinivasan1516/jenkins-advancedautomation.git'
      }
    }

    stage('Build') {
      steps {
        sh '''
          cd backend
          npm install
        '''
      }
    }

    stage('Deploy New Version') {
      steps {
        sh '''
          cd scripts
          ./deploy.sh
        '''
      }
    }

    stage('Switch Traffic') {
      steps {
        sh '''
          cd scripts
          ./switch.sh
        '''
      }
    }
  }

  post {
    failure {
      echo "Deployment failed! Rollback manually if required."
    }
  }
}

