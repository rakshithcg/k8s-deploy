pipeline {
    agent none

    stages {
        stage('Stage1:checkout') {
            agent {label 'docker-1'}
            steps {
                git branch: 'main', credentialsId: 'git-credentials', url: 'https://github.com/rakshithcg/java-ex.git'          
            }
        }
    stage('Stage2:Build-1') {
            agent {label 'docker-1'}
            steps {
              sh 'docker build -t javapp .'
            }
        }
       stage('Stage3:Push') {
            agent {label 'docker-1'}
            steps {
               sh 'docker tag javaapp rakshithcg/rakshithg:ver$BUILD_NUMBER'
               sh 'docker push rakshithcg/rakshithg:ver$BUILD_NUMBER'
            }
        }  
    stage('Stage4:Deploy') {
            agent {label 'kubernetes'}
            steps {
               sh 'kubectl set image deploy webapp-deploy k8s-ct=rakshithcg/rakshithg:ver$BUILD_NUMBER'
            }
        }
    }
}
