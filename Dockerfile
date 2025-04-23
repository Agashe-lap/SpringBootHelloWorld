FROM maven:3.8.1-openjdk-17 as Build
COPY . .
RUN mvn clean packege -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY  --from=Build/ target/demo-0.0.1-SNAPSHOT.jar HelloWorldGitHub.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","HelloWorldGitHub.jar"]