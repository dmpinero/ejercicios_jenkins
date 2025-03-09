FROM jenkins/jenkins:lts

USER root

# Reference install gradle: https://medium.com/@migueldoctor/how-to-create-a-custom-docker-image-with-jdk8-maven-and-gradle-ddc90f41cee4
RUN apt update

# Instalar Java 17
RUN apt install -y openjdk-17-jdk

# Gradle version
#ARG GRADLE_VERSION=6.6.1
ARG GRADLE_VERSION=7.3

# Define the URL where gradle can be downloaded
ARG GRADLE_BASE_URL=https://services.gradle.org/distributions

# Define the SHA key to validate the gradle download
ARG GRADLE_SHA=de8f52ad49bdc759164f72439a3bf56ddb1589c4cde802d3cec7d6ad0e0ee410

# Create the directories, download gradle, validate the download
# install it remove download file and set links
RUN mkdir -p /usr/share/gradle /usr/share/gradle/ref \
  && echo "Downloading gradle hash" \
  && curl -fsSL -o /tmp/gradle.zip ${GRADLE_BASE_URL}/gradle-${GRADLE_VERSION}-bin.zip \
  && echo "Checking download hash" \
  && echo "${GRADLE_SHA} /tmp/gradle.zip" | sha256sum -c - \
  && echo "Unziping gradle" && unzip -d /usr/share/gradle /tmp/gradle.zip \
  && echo "Clenaing and setting links" && rm -f /tmp/gradle.zip \
  && ln -s /usr/share/gradle/gradle-${GRADLE_VERSION} /usr/bin/gradle
