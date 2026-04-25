pipeline{
    scm checkout
    agent { label "agent-1"}
    stages{
        stage("build"){
            steps{
                sh '''
                docker build -t static-page:1.0.0 .
                '''
            }
        }
        stage("push"){
            steps{
                withCredentials[(usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPass'))]{
                    sh '''
                    docker login -u ${env.dockerHubUser} -p ${dockerHubPass}
                    docker tag static-page:1.0.0 "${USER}"/static-apge:1.0.0
                    docker push "${env.dockerHubUer}"/static-page:1.0.0
                    '''
                }
            }
        }
        stage("deploy"){
            steps{
                sh '''
                docker compose up -d .
                '''
            }
        }
    }
}