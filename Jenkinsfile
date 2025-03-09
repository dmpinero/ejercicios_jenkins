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
                    
                    // Compilar el código fuente especificando Java 17
                    sh '''
                        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
                        ./gradlew compileJava --info
                    '''
                }
            }
        }
    }
} 