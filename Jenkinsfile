pipeline {
    agent any

    tools {
        maven 'Maven3'
       // java 'Java21'
      }

    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/osmanalisevinc/hello-world']])
                bat 'mvn clean install'
            }
        }
        stage('Docker Image') {
            steps {
                bat 'docker build --build-arg JAR_FILE=/target/demo-v1.jar -t osmanalisevinc/hello-world:001 .'
                bat 'mvn clean install'
               }
        }

        stage('Docker Image to Dockerhub') {
            steps {
               script{
                   withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                     bat 'echo docker login -u osmanalisevinc -p ${dockerhub}'
                     bat 'docker push osmanalisevinc/hello-world:001'
                    }
                  }
                }
            }

        stage('kubernetes pod') {
            steps {

               }
        }


    }
}
