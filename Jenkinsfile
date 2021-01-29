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
        //hudson.plugins.sonar.SonarRunnerInstallation 'SONARQUBE'
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('pull-repositorio'){
            steps{
                //sh "ls"
                //echo "PORFAVORFUNCIONA"
                //echo "entre a pull-repositorio"
                dir('pep3tingeso'){
                    sh "git pull origin main"
                }
                
                //echo "voy a salir de pull-repositorio"
                //sh "kubectl get deployments"
                //sh "kubectl get namespaces"
                //sh "kubectl apply -f /pep3tingeso/backend-deployment.yaml"
                //sh "kubectl cluster-info"
                //sh "minikube start"
                //sshagent(credentials: ['serverpep3tingeso']){
                //    sh 'ssh -o StrictHostKeyChecking=no root@159.203.75.95'
                //    script{
                //        sh 'ssh root@159.203.75.95 kubectl'
                        //sh 'ssh root@159.203.75.95 cd miau && ls && kubectl apply -f backend-deployment.yaml'
                //        sh 'ssh root@159.203.75.95 ls && cd pep3tingeso && ls && kubectl apply -f /pep3tingeso/backend-deployment.yaml'
                //    }
                //}
                //sh "ls"
            }
        }
        //stage('Lint'){
        //    steps{
        //        withSonarQubeEnv('SONARQUBE') { // Will pick the global server connection you have configured
        //            sh './gradlew sonarqube'
        //        }
        //    }
        //}
        //stage('Mega-Linter') {
        //    agent {
        //        docker {
        //            image 'nvuillam/mega-linter:v4'
        //            args "-e VALIDATE_ALL_CODEBASE=true -v ${WORKSPACE}:/tmp/lint --entrypoint=''"
        //            reuseNode true
        //        }
        //    }
        //    steps {
        //        sh '/entrypoint.sh'
        //    }
        //}
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
                dir("/var/lib/jenkins/workspace/PEP3/frontenddos") {
                    sh "cat /var/lib/jenkins/workspace/PEP3/frontenddos/src/views/Calculadora.vue"
                    sh "docker build . -t frontimage"
                    sh "docker tag frontimage belenrickmers/front3"
                    //sh "docker push belenrickmers/front3"
                    script {
                        //front-image = docker.build registry1
                        docker.withRegistry( '', registryCredential ) {
                        //frontimage.push()
                        sh "docker push belenrickmers/front3"
                        }     
                    }   
                echo "voy a salir de Build-frontend"
                }
            }
        }

        stage('Build-backend'){
            steps{
                echo "entre a Build-backend"
                dir("/var/lib/jenkins/workspace/PEP3/backend") {
                    sh 'chmod +x ./gradlew'
                    sh "./gradlew build"
                    sh "docker build . -t backend-image"
                    script {
                        //front-image = docker.build registry1
                        docker.withRegistry( '', registryCredential ) {
                        //frontimage.push()
                        sh "docker push belenrickmers/back3"
                        }     
                    }  
                }
                //sh "docker tag backend-image belenrickmers/back3"
                //sh "docker push belenrickmers/back3"
                echo "voy a salir de Build-backend"
            }
        }

        stage('Deploy-backend'){
            steps{
                sh "ls"
                echo "entre a Deploy-backend"
                //sh "kubectl delete deployment backend-deployment"
                //sh "kubectl delete service localhost"
                sh "ls"
                //sshagent(credentials: ['serverdos']){
                //    sh "ssh root@159.203.75.95 kubectl apply -f backend-deployment.yaml"
                //    sh "ssh root@159.203.75.95 kubectl apply -f backend-service.yaml"
                //}
                dir('/var/lib/jenkins/workspace/PEP3/'){
                    sh "kubectl get deployments"
                    sh "kubectl get services"
                    sh "kubectl delete deployment.apps/backend-deployment"
                    sh "kubectl delete service/localhost"
                    sh "kubectl apply -f backend-deployment.yaml"
                    sh "kubectl apply -f backend-service.yaml"
                }
                echo "voy a salir de Deploy-backend"
            }
        }
        stage('Deploy-frontend'){
            steps{
                echo "entre a Deploy-frontend"
                //sh "kubectl delete deployment frontend-deployment"
                //sh "kubectl delete service frontend-service"
                dir('/var/lib/jenkins/workspace/PEP3/'){
                    sh "kubectl delete deployment.apps/frontend-deployment"
                    sh "kubectl delete service/frontend-service"
                    sh "kubectl apply -f frontend-deployment.yaml"
                    sh "kubectl apply -f frontend-service.yaml"
                }
                sh "ls"
                sh "kubectl get deployments"
                sh "kubectl get services"
                sh "kubectl config view | grep namespace"
                echo "voy a salir de Deploy-frontend"
            }
        }
        stage('Fin') {
            steps {
                echo 'FIN'
            }
        }
    }
}