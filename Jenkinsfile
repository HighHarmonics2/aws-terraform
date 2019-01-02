pipeline {
    agent {dockerfile true}
    options {
        withAWS(credentials:'ca4cd14d-c732-4137-b441-b19512930b03')
    }
    stages {
        stage('terragrunt init') {
            steps {
                dir('308620678440') {
                    sh '''
                    cd ./s3/
                    terragrunt init
                    '''
                }
            }
        }
    }
}
