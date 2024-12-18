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
        maven 'Maven 3.8.7'
        jdk 'Java_17'
    }
    stages {
        stage('VCS') {
            steps {
                git branch: 'develop',
                url: 'https://github.com/springpet-clinic/game-of-life.git'
            }
        }
        stage('build') {
            steps {
                sh script: 'mvn package'
            }
        }
        stage('reporting') {
            steps{
                archiveArtifacts artifacts: '**/target/springpetclinic-*.jar'
                junit testResults: '**/target/surefire-reports/TEST-*.xml'
            }
        }
    }
}