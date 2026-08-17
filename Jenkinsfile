// Jenkins CI/CD practice
pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh './test.sh'
            }
        }
       
        stage('Credential Test') {
           steps {
             withCredentials([usernamePassword(
                 credentialsId: 'demo-credential',
                 usernameVariable: 'DEMO_USER',
                 passwordVariable: 'DEMO_PASS'
        )])     {
                 sh 'echo "Username is $DEMO_USER"'
        }
    }
}
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
