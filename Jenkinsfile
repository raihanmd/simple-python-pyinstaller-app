pipeline {
    agent any

    environment {
        SSH_USERNAME = 'lynxdev'
        SSH_HOST = '103.150.197.107'
        SSH_KEY_PATH = '/home/.ssh/lynxdeveloper471.pem'
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Setting up Python environment...'
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install -r requirements.txt'
            }
        }
        
        stage('Build') {
            agent {
                docker {
                    image 'python:3.9-slim'
                }
            }
            steps {
                echo 'Installing dependencies...'
                sh 'pip install -r requirements.txt'
            }
        }
        
        stage('Test') {
            agent {
                docker {
                    image 'python:3.9-slim'
                }
            }
            steps {
                echo 'Running unit tests...'
                sh './venv/bin/pytest --junitxml=report.xml'
            }
        }
        
        stage('Delivery') {
            agent {
                docker {
                    image 'python:3.9-slim'
                    args '-p 5000:5000'
                }
            }
            steps {
                sh './jenkins/scripts/deliver.sh'
                echo 'Visit http://localhost:5000 to see your Flask application in action.'
                echo 'Waiting for 60 seconds...'
                sh 'sleep 60'
                echo 'Stopping the application in Jenkins env...'
                sh './jenkins/scripts/kill.sh'
            }
        }
        
        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy? (Klik Proceed untuk melanjutkan, atau Abort untuk menghentikan pipeline)'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying Flask app to VPS...'
                sh './jenkins/scripts/deploy-to-vps.sh'
            }
        }
    }
}
