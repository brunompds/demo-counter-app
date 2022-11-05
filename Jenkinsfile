pipeline {
    options
    {
        timeout(time:10, unit: 'MINUTES')
    }
    agent any
    tools {
        maven 'Maven3.6.3'
    }
    stages{
        stage('CLEAN WORKSPACE'){
            steps{
                echo "\n############# CLEAN WORKSPACE #############\n"
                cleanWs()
            }
        }
        stage('GIT CHECKOUT'){
            steps{
                echo "\n############## GIT CHECKOUT ###############\n"
                git branch: 'main', url: 'https://github.com/brunompds/demo-counter-app.git'
            }
        }
        stage('UNIT TESTING'){
            steps{
                echo "\n############## UNIT TESTING ###############\n"
                sh 'mvn test'
            }
        }
        stage('INTEGRATION TESTING'){
            steps{
                echo "\n########### INTEGRATION TESTING ###########\n"
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage('MAVEN BUILD'){
            steps{
                echo "\n############### MAVEN BUILD ###############\n"
                sh 'mvn clean install'
            }
        }
        /*
        stage('SONARQUBE ANALYSIS'){
            steps{
                echo "\n############ SONARQUBE ANALYSIS ############\n"
                script{
                    withSonarQubeEnv(installationName: 'sonarserver', credentialsId: 'sonar-api') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('QUALITY GATE STATUS'){
            steps{
                echo "\n############ QUALITY GATE STATUS ###########\n"
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
                }
            }
        }
        */
        stage('UPLOAD WAR FILE O NEXUS'){
            steps{
                echo "\n########## UPLOAD WAR FILE O NEXUS #########\n"
                script{
                    def readPomVersion = readMavenPom file: 'pom.xml'
                    def nexusRepo = readPomVersion.version.endsWith("SNAPSHOT")?"demoapp-snapshot":"demoapp-release"
                    nexusArtifactUploader artifacts: 
                    [
                        [
                            artifactId: 'springboot', 
                            classifier: '', 
                            file: 'target/Uber.jar', 
                            type: 'jar'
                        ]
                    ], 
                    credentialsId: 'nexus-auth', 
                    groupId: 'com.example', 
                    nexusUrl: '192.168.1.70:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'demoapp-release', 
                    //version: '1.0.0'
                    version: "${readPomVersion.version}"
                }
            }
        }
    }
}
