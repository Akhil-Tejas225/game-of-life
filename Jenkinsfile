pipeline {
    agent { label 'JDK_8' }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 30, unit: 'MINUTES')
    }
    triggers { 
        pollSCM('* * * * *')
    }

    
    tools {
        maven 'Maven_3.8'
        jdk 'JDK_8'
    }
    stages {
        stage('VCS') {
            steps {
                git branch: 'develop',
                       url: 'https://github.com/Akhil-Tejas225/game-of-life.git'
            }
        }
        stage('build') {
            steps {
                sh script: 'mvn package'
            }
        }
        stage('reporting') {
            steps{
                archiveArtifacts artifacts: '**/target/gameoflife.war'
                junit testResults: '**/target/surefire-reports/TEST-*.xml'
            }
        }
    }
    post {
        success {
            mail subject: "${JOB_NAME}: has completed with success",
                 body: "${JOB_NAME}: has completed with success",
                 to: "all@qt.com"

        }
        failure {
         
            mail subject: "${JOB_NAME}: has completed with success",
             ##this is for testing ##
                 body: "${JOB_NAME}: has completed with success", 
                 to: "all@qt.com"

        }
}
}    