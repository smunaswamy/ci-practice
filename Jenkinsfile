// Jenkins CI/CD practice
pipeline {
    agent {
        label 'linux-agent'
    }

    environment {
        APP_ENV = "${params.APP_ENV}"
    }

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
                )]) {
                    sh 'echo "Username is $DEMO_USER"'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploying to $APP_ENV"'
                sh './deploy.sh'
            }
        }

        stage('Package') {
            steps {
                sh 'tar -czf ci-practice.tar.gz app.sh deploy.sh test.sh server'
                archiveArtifacts artifacts: 'ci-practice.tar.gz'
            }
        }
    }
}
