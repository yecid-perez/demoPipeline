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
                sh 'docker run -d -p 4045:80 demo:latest'
            }
        }
		stage('E2E') {
            steps {
                bat 'node_modules/.bin/ng test --browsers ChromeHeadless --watch=false'
            }
		}
		stage('Clean') {
            steps {
                sh 'docker stop $(docker ps -a -q)'
                sh 'docker rm $(docker ps -a -q)'
            }
		}
    }
}