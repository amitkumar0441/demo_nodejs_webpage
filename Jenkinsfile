pipeline {
    agent any 
    tools {
        nodejs 'node-js20' 
    }
    stages {
        stage('stage01- clone the code') {
            steps {
                git branch: 'main', url: 'https://github.com/amitkumar0441/demo_nodejs_webpage.git'
            }
        }
        stage('stage02- install the dependencies ') {
            steps {
            sh 'npm install'   
            }
        }

        stage('stage04- create the docker image'){
            steps{
                sh 'docker build -t amitkumar0441/adityajaiswalnodeproject:${BUILD_NUMBER} .'
            }
        }
        stage('stage 05- push image to dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockercredentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push amitkumar0441/adityajaiswalnodeproject:${BUILD_NUMBER}
                        docker logout
                    '''
                }
            }
        }
        stage('stage06- run the docker container'){
            steps{
                sh 'docker run -d --name meracontainer -p 8081:8081 amitkumar0441/adityajaiswalnodeproject:${BUILD_NUMBER}'
            }
        }
    }
}