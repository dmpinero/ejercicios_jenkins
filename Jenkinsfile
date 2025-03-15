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

        stage('Check Environment') {
            steps {
                sh '''
                    echo "=== Java Version ==="
                    java -version
                    echo "\n=== JAVA_HOME ==="
                    echo $JAVA_HOME
                    echo "\n=== Which Java ==="
                    which java
                    echo "\n=== Java Path ==="
                    readlink -f $(which java)
                '''
                
                dir('jenkins-resources/calculator') {
                    sh '''
                        echo "\n=== Gradle Version ==="
                        ./gradlew --version
                    '''
                }
            }
        }
        
        stage('Compile') {
            steps {
                dir('jenkins-resources/calculator') {
                    // Dar permisos de ejecución al gradlew
                    sh 'chmod +x ./gradlew'
                    
                    // Compilar el código fuente usando el JDK configurado en tools
                    sh '''
                        ./gradlew clean
                        ./gradlew compileJava --debug
                    '''
                }
            }
        }
    }
} 