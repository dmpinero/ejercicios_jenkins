pipeline {
    agent any

    tools {
        // Definir la versión de Java a usar
        jdk 'JDK17'
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
        
        stage('Compile') {
            steps {
                dir('jenkins-resources/calculator') {
                    // Dar permisos de ejecución al gradlew
                    sh 'chmod +x ./gradlew'
                }
            }
        }
    }
} 