pipeline {
    agent any

    tools {
        maven 'Maven 3'
    }

    environment {
        GITHUB_REPO_URL = 'https://github.com/gishee003/SPE_Mini_Project'
    }

    stages {
        stage('Clone Git') {
            steps {
                git branch: 'main',
                    credentialsId: 'github_credentials',
                    url: "${GITHUB_REPO_URL}"
            }
        }

        stage('Test') {
            steps {
                // This runs the JUnit tests
                sh 'mvn test'
            }
        }

        stage('Build JAR') {
            steps {
                // This packages the application into a .jar file
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Verify Output') {
            steps {
                // Confirms the JAR exists in the target folder
                sh 'ls -l target/*.jar'
            }
        }
    }
}