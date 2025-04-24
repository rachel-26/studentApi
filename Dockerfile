# Use official OpenJDK 17 as base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the Spring Boot JAR
COPY target/student-api-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8083
EXPOSE 8083

# Set environment variables
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/studentdb
ENV SPRING_DATASOURCE_USERNAME=postgres
ENV SPRING_DATASOURCE_PASSWORD=mwema

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]