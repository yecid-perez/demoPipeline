pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'docker build -t demo .'
            }
		}
		stage('deploy') {
            steps {
                sh 'docker run -d -p 4040:80 demo:latest'
            }
        }
    }
}