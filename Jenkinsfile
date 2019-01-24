pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'docker build -t DemoJenkins .'
            }
		}
		stage('deploy') {
            steps {
                sh 'docker run -d -p 4000:80 DemoJenkins:latest .'
            }
        }
    }
}