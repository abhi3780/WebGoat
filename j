pipeline {
  agent any 
  tools {
    maven 'maven'
  }
  stages {
    stage ('Initialize') {
      steps {
        sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
            ''' 
      }
    }    
    stage ('Build') {
      steps {
      //sh 'mvn clean -Dmaven.test.skip=true -X'
      //sh 'ls /var/jenkins_home/workspace/webgoat_pipeline/webgoat-server'
      sh 'mvn -B docker:build'
      }
    }
  }
}
