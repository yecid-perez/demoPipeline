pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'docker build -t demo-jenkins .'
            }
		}
		stage('deploy') {
            steps {
                sh 'docker run -d -p 4000:80 demo-jenkins:latest .'
            }
        }
    }
}