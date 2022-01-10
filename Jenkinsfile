pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Start building...'
                echo 'Build...'
                echo 'Finished building'
            }
        }
        stage('Test') {
            steps {
                echo 'Run SpecFlow Tests'
                bat """
                   runTest.bat
                """
                echo 'Finished SpecFlow Tests'
            }
            post {
                always {  
                    publishHTML (
                        [ allowMissing: false,
                          alwaysLinkToLastBuild: false,
                          keepAll: true,
                          reportDir: 'test_results',
                          reportFiles: '*LivingDoc*.html',
                          reportName: 'SpecFlow Example LivingDoc Report'
                        ]
                    )
                }
            }
        }
    }
}
