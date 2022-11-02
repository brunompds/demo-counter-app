pipeline {
    agent any
    tools {
        maven 'Maven3.6.3'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/brunompds/demo-counter-app.git'
            }
        }
        stage('UNIT testing'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Integration testing'){
            steps{
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn clean install'
            }
        }
    }
}