pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ajop232/scientific'
        DOCKER_CREDENTIALS = 'docker-hub-credentials'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/akankshjoshi/fullproject.git'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'bats test_calculator.bats'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t calculator-shell .'
            }
        }

        stage('Authenticate & Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: 'https://index.docker.io/v1/']) {
                    sh '''
                        docker tag calculator-shell $DOCKER_IMAGE
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker stop calculator-app || true
                    docker rm calculator-app || true
                    docker run -d --name calculator-app $DOCKER_IMAGE
                '''
            }
        }
    }
}
