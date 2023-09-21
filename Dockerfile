FROM openjdk:18-slim

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy the source code to the container
COPY . /app

# Build the project
RUN mvn clean package -Pproduction

# Copy the built application JAR file to the `app` directory
COPY target/*.jar /app/app.jar

# Expose port 8080
EXPOSE 8080

# Start the application
CMD ["java", "-jar", "/app/app.jar"]




# FROM openjdk:18-slim
#
# COPY target/*.jar /app/app.jar
#
# EXPOSE 8080
#
# ENTRYPOINT ["java", "-jar", "/app/app.jar"]