pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('pull-repositorio'){
            steps{
                sh "cd pep3tingeso"
                sh "git pull origin main"
            }
        }
        stage('Build-backend'){
            steps{
                sh "./gradlew build"
                sh "docker build . -t backend16"
                sh "AQUI DEBERÍAMOS SUBIR LA IMAGEN"
            }
        }
        stage('Test-backend'){
            steps{
                sh "cd backend"
                sh "./gradle test"
            }
        }
        stage('Deploy-backend'){
            steps{
                sh "kubeclt delete deployment backend-deployment.yaml"
                sh "kubectl delete service backend-service.yaml"
                sh "kubectl create -f backend-deployment.yaml"
                sh "kubectl create -f backend-service.yaml"
            }
        }
        stage('Build') {
            steps {
                echo 'Building'
                echo 'Probar commit'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}