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

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build --no-cache -t kirtinigam003/scientific-calculator:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // This securely logs you in using the credentials we just saved
                    withCredentials([usernamePassword(credentialsId: 'docker_hub_login', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"
                        sh "docker push kirtinigam003/scientific-calculator:latest"
                    }
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                // This command triggers the Ansible playbook
                sh 'ansible-playbook -i inventory.ini deploy.yml'
            }
        }

        stage('Verify Output') {
            steps {
                // Confirms the JAR exists in the target folder
                sh 'ls -l target/*.jar'
            }
        }
    }

    post {
        success {
            mail to: 'kirtinigam003@gmail.com',
                 subject: "SUCCESS: Build #${env.BUILD_NUMBER} of ${env.JOB_NAME}",
                 body: "Great job! The calculator build and deployment were successful. \nCheck it out at: ${env.BUILD_URL}"
        }
        failure {
            mail to: 'kirtinigam003@gmail.com',
                 subject: "FAILED: Build #${env.BUILD_NUMBER} of ${env.JOB_NAME}",
                 body: "The build failed. Please check the console output here: ${env.BUILD_URL}"
        }
    }
}