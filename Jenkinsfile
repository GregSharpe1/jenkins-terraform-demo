#!groovy

def userInput

pipeline {
  agent any
  environment {
    TERRAFORM_CMD = '/usr/bin/terraform'
    AWS_ACCESS_KEY_ID = credentials('JenkinsToS3_Public')
    AWS_SECRET_ACCESS_KEY = credentials('JenkinsToS3_Private')
  }
  parameters {
    booleanParam(
      defaultValue: false,
      description: "Would you like to destroy the environment?",
      name: "RunDestroy"
    )
    string(
      name: "Parallelism",
      defaultValue: "2",
      description: "Run this in parallel?"
    )
  }
  stages {
    stage('Initialise') {
      steps {
        ansiColor('xterm') {
          dir('terraform/') {
            sh "${TERRAFORM_CMD} --version"
            sh "${TERRAFORM_CMD} init"
          }
        }
      }
    }

  stage('Test') {
    steps {
      ansiColor('xterm') {
        dir('terraform/') {
          echo "Run TF Validate"
          sh "${TERRAFORM_CMD} validate"
        }
      }
    }
  }

  stage('Plan') {
    steps {
      ansiColor('xterm') {
        dir('terraform/') {
          script {
            if (params.RunDestroy ==~ /(?i)(N|NO|F|FALSE|OFF)/){
              echo "Plan Apply"
              sh "${TERRAFORM_CMD} plan"
            } else {
              echo "Plan Destroy"
              sh "${TERRAFORM_CMD} plan -destroy"
            }
          }
        }
      }
    }
  }

  stage('Approval') {
    steps {
      script {
        userInput = input(id: 'confirm',
        message: 'Apply Terraform?',
        parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
      }
    }
  }

  stage('Apply') {
    steps {
      ansiColor('xterm') {
        dir('terraform/') {
          script {
            if (userInput == true) {
              if (params.RunDestroy ==~ /(?i)(N|NO|F|FALSE|OFF)/){
                echo "Apply"
                sh "${TERRAFORM_CMD} apply -parallelism=${params.Parallelism}"
              } else {
                echo "Destroy"
                sh "${TERRAFORM_CMD} destroy -parallelism=${params.Parallelism} -auto-approve"
              }
            } else {
              echo "Skipping"
            }
          }
        }
      }
    }
  }
 }
 post {
    always{
      deleteDir()
    }
  }
}
