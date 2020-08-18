pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git credentialsId: 'a4c1e6db-1983-4e35-84e6-2a34930b8bcc', url: 'https://github.com/vivekmprac/jenklins-cicd.git'

                // Run Maven on a Unix agent.
                bat "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

        }
        stage("maven sonar") {
            steps {
                bat "mvn -Dmaven.test.failure.ignore=true sonar:sonar"
            }
        }
        stage("maven-nexus") {
            steps {
                bat "mvn -Dmaven.test.failure.ignore=true deploy"
            }
        }
        stage("tomcat deploy"){
            steps {
                bat "mvn -Dmaven.test.failure.ignore=true tomcat7:deploy"
            }
        }
    }
}
