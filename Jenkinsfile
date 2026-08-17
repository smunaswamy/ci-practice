// Jenkins CI/CD practice
pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh './test.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
