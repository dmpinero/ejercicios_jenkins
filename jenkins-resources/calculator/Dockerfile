# Use Eclipse Temurin 11 as base image for better compatibility with Spring Boot 2.4.13
FROM eclipse-temurin:11-jdk-alpine AS build

# Set working directory
WORKDIR /app

# Copy gradle wrapper and build files
COPY gradlew .
COPY gradle gradle/
COPY build.gradle .
COPY settings.gradle .

# Make gradlew executable
RUN chmod +x ./gradlew

# Copy source code
COPY src src/

# Build the application
RUN ./gradlew build -x test

# Use a smaller runtime image
FROM eclipse-temurin:11-jre-alpine

# Set working directory
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]