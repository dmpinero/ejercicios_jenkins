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
                    // Crear directorio si no existe
                    sh 'mkdir -p gradle/wrapper'
                    
                    // Descargar los archivos necesarios del wrapper
                    sh '''
                        wget -O gradle/wrapper/gradle-wrapper.jar https://github.com/gradle/gradle/raw/v7.6.0/gradle/wrapper/gradle-wrapper.jar
                        
                        echo "distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\\://services.gradle.org/distributions/gradle-7.6-bin.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists" > gradle/wrapper/gradle-wrapper.properties
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