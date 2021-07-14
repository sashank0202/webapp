pipeline {
    agent any

    stages {
        stage('Pull COde from SCM') {
            steps {
                git credentialsId: 'sashank0202-GitHub-Creds', url: 'https://github.com/sashank0202/webapp.git'
            }
        }
        stage("Bulding the app using maven") {
            steps {
                withMaven(maven: 'M2_HOME') {
                    sh 'mvn clean install package'
                }
            }
        }
        stage('pulling the docker image') {
            steps {
                sh 'docker build -t sashank0202/my-1st-tomcat:1.0.0 .'
            }
        }
        stage('pushing image to dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'sashank0202-DockerHub-Pwd', variable: 'dockerhubpwd')]) {
                    sh "docker login -u sashank0202 -p ${dockerhubpwd}"
                }
                sh 'docker push sashank0202/my-1st-tomcat:1.0.0'
            }
        }
        stage('running the tc image pulled') {
            steps {
                sh 'docker run -dit --name cicd-tc-webapp -p 8888:8080 sashank0202/my-1st-tomcat:1.0.0'
            }
        }
    }
}
