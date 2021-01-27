pipeline {
    agent any
    tools{
        gradle 'GRADLE'
        java 'JAVA'
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('pull-repositorio'){
            steps{
                echo "PORFAVORFUNCIONA"
                echo "entre a pull-repositorio"
                sh "git pull origin main"
                echo "voy a salir de pull-repositorio"
            }
        }
        stage('Test-backend'){
            steps{
                echo "entre a Test-backend"
                echo "entre a Test-backend"
                sh "ls"
                dir("backend") {
                    sh 'chmod +x ./gradlew'
                    sh './gradlew test'
                }
                sh "cd .."
                echo "voy a salir de Test-backend"
            }
        }
        stage('Build-frontend'){
            steps{
                echo "entre a Build-frontend"
                sh "cd frontenddos"
                sh "docker build . -t frontend-image"
                sh "docker frontend-image belenrickmers/front"
                sh "docker push belenrickmers/front"
                sh "cd .."
                echo "voy a salir de Build-frontend"
            }
        }
        stage('Build-backend'){
            steps{
                echo "entre a Build-backend"
                sh "cd backend"
                sh "./gradlew build"
                sh "docker build . -t backend-image"
                sh "docker backend-image belenrickmers/back"
                sh "docker push belenrickmers/back"
                sh "cd .."
                echo "voy a salir de Build-backend"
            }
        }
        stage('Deploy-backend'){
            steps{
                echo "entre a Deploy-backend"
                sh "kubeclt delete deployment backend-deployment.yaml"
                sh "kubectl delete service backend-service.yaml"
                sh "kubectl apply -f backend-deployment.yaml"
                sh "kubectl apply -f backend-service.yaml"
                echo "voy a salir de Deploy-backend"
            }
        }
        stage('Deploy-frontend'){
            steps{
                echo "entre a Deploy-frontend"
                sh "kubeclt delete deployment frontend-deployment.yaml"
                sh "kubectl delete service frontend-service.yaml"
                sh "kubectl apply -f frontend-deployment.yaml"
                sh "kubectl apply -f frontend-service.yaml"
                echo "voy a salir de Deploy-frontend"
            }
        }
        stage('Build') {
            steps {
                echo 'FIN'
            }
        }
    }
}