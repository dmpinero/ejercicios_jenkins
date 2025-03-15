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

        stage('Check Java Version') {
            steps {
                sh '''
                    echo "Java version:"
                    java -version
                    echo "JAVA_HOME:"
                    echo $JAVA_HOME
                '''
            }
        }
        
        stage('Compile') {
            steps {
                dir('jenkins-resources/calculator') {
                    // Dar permisos de ejecución al gradlew
                    sh 'chmod +x ./gradlew'
                    
                    // Compilar el código fuente usando el JDK configurado en tools
                    sh './gradlew compileJava --info'
                }
            }
        }
    }
} 