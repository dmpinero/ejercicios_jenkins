pipeline {
    agent {
        docker { 
            image 'gradle:6.6.1-jre14-openj9'
            args '-v $HOME/.gradle:/home/gradle/.gradle'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                // Limpia el workspace antes de descargar
                cleanWs()
                
                // Descarga el código desde el repositorio específico
                git branch: 'main',
                    url: 'https://github.com/dmpinero/ejercicios_jenkins'
            }
        }

        stage('Check Environment') {
            steps {
                sh '''
                    echo "=== Java Version ==="
                    java -version
                    echo "\n=== Gradle Version ==="
                    gradle --version
                '''
            }
        }
        
        stage('Compile') {
            steps {
                dir('jenkins-resources/calculator') {
                    // Compilar el código fuente usando el JDK configurado en tools
                    sh 'gradle clean compileJava --info'
                }
            }
        }
    }
} 