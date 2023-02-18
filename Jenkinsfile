pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        
    
    stage('Build') { 
            steps { 
                script{
                 sh 'docker build -t emoran/php .'
    
                }
            }
        }
      
        
    stage('SAST'){
            steps {
                 sh 'env | grep -E "JENKINS_HOME|BUILD_ID|GIT_BRANCH|GIT_COMMIT" > /tmp/env'
                 sh 'docker pull registry.fortidevsec.forticloud.com/fdevsec_sast:latest'
                 sh 'docker run --rm --env-file /tmp/env --mount type=bind,source=$PWD,target=/scan registry.fortidevsec.forticloud.com/fdevsec_sast:latest'
            }
        }

        
                stage('Push') {
            steps {
                script{
                        docker.withRegistry('https://363412468025.dkr.ecr.us-east-2.amazonaws.com/test01', 'ecr:us-east-2:emoran') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
        
        
        
        
    }
}
