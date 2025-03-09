pipeline {
    agent any

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
                dir('calculator') {
                    // Dar permisos de ejecución al gradlew
                    sh 'chmod +x ./gradlew'
                    
                    // Compilar el código fuente
                    sh './gradlew compileJava'
                }
            }
        }
    }
} 