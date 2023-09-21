FROM openjdk:18-slim

WORKDIR /app

COPY . .

RUN ./mvnw clean package -Pproduction

CMD ["java", "-jar", "/app/target/*.jar"]