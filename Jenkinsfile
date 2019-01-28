pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t demo .'
            }
		}
		stage('Unit Test') {
            steps {
                sh 'ng test --watch=false'
            }
		}
		stage('Deploy') {
            steps {
                sh 'docker run -d -p 4042:80 demo:latest'
            }
        }
		stage('E2E') {
            steps {
                sh 'ng test --watch=false'
            }
		}
		/*stage('Clean') {
            steps {
                sh 'docker ps -q | % { docker stop $_ }'
            }
		}*/
    }
}