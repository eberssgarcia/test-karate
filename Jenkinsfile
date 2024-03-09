pipeline {
    agent any
    stages {

		stage('Clean workspace directory'){
            steps {
                // define un o muchos pasos
                bat 'echo Clean workspace directory'
                cleanWs notFailBuild: true
            }
        }

		stage('Cleanup stage') {
            steps {
                // define un o muchos pasos
                bat 'echo Cleanup stage'
            }
        }


		stage('Git checkout') {
            steps {
                // define un o muchos pasos
                bat 'echo Git checkout'
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/eberssgarcia/test-karate']])
            }
        }


        stage('Build') {
            steps {
                // Ejecutar las pruebas de Karate
                sh 'mvn clean test'
            }
        }
    }
}
