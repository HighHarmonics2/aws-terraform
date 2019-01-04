pipeline {
    agent {dockerfile true}
    options {
        withAWS(credentials:'ca4cd14d-c732-4137-b441-b19512930b03')
    }
    parameters {
        choice(name: 'ACCOUNT', choices: ['308620678440', 'other'], description: 'Select the AWS account')
        string(name: 'WORKINGDIR', defaultValue: 's3', description: 'working directory for Terraform command')
        choice(name: 'COMMAND', choices: ['init', 'plan', 'apply'], description: 'Select Terraform process for this build')
    }
    stages {
        stage('echo parameters') {
           steps {
              echo "Account param: ${params.ACCOUNT}"
              echo "Working Directory param: ${params.WORKINGDIR}"
              echo "Terraform command param: ${params.COMMAND}"
            }
        }
        stage('terragrunt init') {
            when { expression { params.COMMAND == 'init' } }
            steps {
                dir(params.ACCOUNT) {
                    sh '''
                    cd $WORKINGDIR
                    terragrunt init -input=false
                    '''
                }
            }
        } // stage
        stage('terragrunt plan') {
            when { expression { params.COMMAND == 'plan' } }
            steps {
                dir(params.ACCOUNT) {
                    sh '''
                    cd $WORKINGDIR
                    terragrunt plan -out=$WORKINGDIR.plan
                    '''
                }
            }
        } // stage
        stage('terragrunt apply') {
            when { expression { params.COMMAND == 'apply' } }
            steps {
                dir(params.ACCOUNT) {
                    sh '''
                    cd $WORKINGDIR
                    terragrunt apply -input=false -auto-approve $WORKINGDIR.plan
                    '''
                }
            }
        } // stage
        stage('clean up!') {
            steps {
                cleanWs cleanWhenFailure: false, notFailBuild: true
            }
        } // stage

    } // stages
} // pipeline
