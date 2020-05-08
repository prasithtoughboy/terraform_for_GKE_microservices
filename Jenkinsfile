pipeline {
    agent any

    environment {
        TF_VAR_project     = 'Project_name_gcp'
        TF_VAR_region = 'us-east1'
        TF_VAR_user      = 'admin'
        TF_VAR_password  = 'm8XBWrg2zt8R8JoH'
    }

    stages {
       stage('Set Terraform path') {
           steps {
                 script {
                         def tfHome = tool name: 'Terraform'
                         env.PATH = "${tfHome}:${env.PATH}"
                        }
                 sh ‘terraform  -version’
  
                }
        }

        stage('Plan') {
            steps {
                script {
                    currentBuild.displayName = "${version}"
                }
                sh 'wget http://artifactory_server:8081/artifactory/generic-local-test/gcloud-sa.json'
                sh 'pwd'
                sh 'terraform init'
                sh "terraform plan"
            }
        }

        stage('Apply') {
            steps {
                sh "terraform apply"
            }
        }
    }
}
