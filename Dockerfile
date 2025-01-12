FROM openjdk:21-jdk-slim
RUN useradd -ms /bin/bash tester
USER tester
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]