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
     stage('Checks') {
        parallel {
           stage('Unit Test') {
              steps {
                 sh './test.sh'
            }
        }
 
     stage('Security Check') {
         steps {
            sh 'echo "Running security check"'
         }
      }
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
            when {
                environment name: 'APP_ENV', value: 'staging'
            }

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

        stage('Production Approval') {
            when {
               environment name: 'APP_ENV', value: 'production'
            }    

            steps {
                input message: 'Deploy to production?', ok: 'Deploy'
           }
        }

       stage('Production Deploy') {
           when {
              environment name: 'APP_ENV', value: 'production'
           }

           steps {
              sh 'echo "Deploying to production"'
              sh './deploy.sh'
                }
           }  
    }
post {
    success {
        echo 'Pipeline completed successfully'
    }

    failure {
        echo 'Pipeline failed'
    }

    always {
        echo 'Pipeline finished'
    }
}
}
