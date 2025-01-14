# Stage 1: Build Stage
FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean test
RUN mvn clean package -DskipTests

# Stage 2: Runtime Stage
FROM openjdk:21-jdk-slim AS runtime
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
