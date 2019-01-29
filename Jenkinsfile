pipeline {
    agent any
    stages {
	
        stage('Dependencies') {
            steps {
                sh 'npm install'
            }
		}
		stage('Build') {
            steps {
                sh 'docker build -t demo .'
            }
		}
		stage('Unit Test') {
            steps {
				sh ('node_modules/.bin/ng test --browsers ChromeHeadless --watch=false')
            }
		}
		stage('Deploy') {
            steps {
                sh 'docker run -d --name pipeline-demo -p 4048:80 demo:latest'
            }
        }
		stage('E2E') {
            steps {
                bat 'node_modules/.bin/ng test --browsers ChromeHeadless --watch=false'
            }
		}
		stage('Clean') {
            steps {
                sh 'docker stop pipeline-demo'
                sh 'docker rm pipeline-demo'
            }
		}
    }
}