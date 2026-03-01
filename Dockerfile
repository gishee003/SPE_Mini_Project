# Use a lightweight JDK 17 runtime as the parent image
FROM eclipse-temurin:21-jdk-focal

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file built by Maven into the container
# Replace 'SPE_Mini_Project-1.0-SNAPSHOT.jar' if your artifact name differs
COPY target/SPE_Mini_Project-1.0-SNAPSHOT-jar-with-dependencies.jar app.jar

CMD ["java", "-jar", "app.jar"]