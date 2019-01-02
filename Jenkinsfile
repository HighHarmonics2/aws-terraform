pipeline {
    agent {dockerfile true}
    options {
        withAWS(profile:'jure2')
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
