pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "my-flask-app:${params.TAG}"
        DOCKER_CONTAINER_NAME = "my-flask-app-container"
    }
    parameters {
        string(name: 'TAG', defaultValue: 'v1', description: 'Docker Image Tag')
        string(name: 'PORT', defaultValue: '8080', description: 'Port to Run Application')
    }
    stages {
        stage('Build') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh "whoami"
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo "Deploying Docker container..."
                    sh "docker stop ${DOCKER_CONTAINER_NAME} || true"
                    sh "docker rm ${DOCKER_CONTAINER_NAME} || true"
                    sh "docker run -d -p ${params.PORT}:80 --name ${DOCKER_CONTAINER_NAME} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}

