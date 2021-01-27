pipeline {
    agent any
    environment {
        registry1 = "front3"
        registry2 = "back3"
        registryCredential = 'docker'
        frontImage = ''
        backImage = ''
    }
    tools{
        gradle 'GRADLE'
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
                echo "voy a salir de Test-backend"
            }
        }
        stage('Build-frontend'){
            steps{
                echo "entre a Build-frontend"
                dir("frontenddos") {
                    sh "docker build . -t front-image"
                    sh "docker tag front-image belenrickmers/front3"
                    sh "docker push belenrickmers/front3"
                    //script {
                        //frontImage = docker.build registry1
                        //docker.withRegistry( '', registryCredential ) {
                        //frontImage.push()
                        //}     
                    }   
                echo "voy a salir de Build-frontend"
            }
        }

        stage('Build-backend'){
            steps{
                echo "entre a Build-backend"
                dir("backend") {
                    sh 'chmod +x ./gradlew'
                    sh "./gradlew build"
                    sh "docker build . -t backend-image"
                }
                sh "docker tag backend-image belenrickmers/back3"
                sh "docker push belenrickmers/back3"
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