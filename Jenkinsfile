pipeline {
    agent {dockerfile true}
    options {
        withAWS(credentials:'ca4cd14d-c732-4137-b441-b19512930b03')
    }
    parameters {
        choice(name: 'ACCOUNT', choices: ['308620678440', 'other'], description: 'Select the AWS account')
        string(name: 'WORKINGDIR', defaultValue: 's3', description: 'working directory for Terraform command')
        choice(name: 'COMMAND', choices: ['Init', 'Plan', 'Apply'], description: 'Select Terraform process for this build')
    }
    stages {
        stage('terragrunt init') {
            steps {
                dir("${params.ACCOUNT}") {
                    sh '''
                    cd $WORKINGDIR
                    terragrunt init
                    '''
                }
            }
        }
    }
}
