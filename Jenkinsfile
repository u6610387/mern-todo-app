pipeline {
    agent {
        docker {
            image 'docker:24.0.5'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = "kitiratpisithaporn/finead-todo-app:latest"
    }

    stages {

        stage('Containerise') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }

    }
}