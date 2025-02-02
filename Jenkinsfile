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
        stage('stage03- security check'){
            steps{
                dependencyCheck additionalArguments: '--scan ./ --format HTML ', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
    }
}