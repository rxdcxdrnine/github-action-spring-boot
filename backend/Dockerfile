FROM openjdk:11-jre-slim-buster
ARG JAR_FILE=./build/libs/airbnb-0.0.1.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dspring.profiles.active=test", "-jar","/app.jar"]
