pipeline {
    agent any
    tools {
        maven 'Maven 3.8.6'
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

    }
}