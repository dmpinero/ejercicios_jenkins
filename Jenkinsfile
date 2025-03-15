pipeline {
    agent any

    tools {
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

        stage('Set Permissions') {
            steps {
                sh '''
                    echo "=== Setting Gradle Wrapper Permissions ==="
                    chmod +x jenkins-resources/calculator/gradlew
                '''
            }
        }

        stage('Update Gradle') {
            steps {
                dir('jenkins-resources/calculator') {
                    // Primero actualizamos el wrapper de Gradle
                    sh '''
                        rm -f gradle/wrapper/gradle-wrapper.jar
                        rm -f gradle/wrapper/gradle-wrapper.properties
                        ./gradlew wrapper --gradle-version 7.6 --distribution-type bin
                    '''
                }
            }
        }

        stage('Check Environment') {
            steps {
                sh 'java -version'
                dir('jenkins-resources/calculator') {
                    sh './gradlew --version'
                }
            }
        }
        
        stage('Compile') {
            steps {
                dir('jenkins-resources/calculator') {
                    // Compilar el código fuente usando el JDK configurado en tools
                    sh './gradlew clean compileJava --info'
                }
            }
        }
    }
} 