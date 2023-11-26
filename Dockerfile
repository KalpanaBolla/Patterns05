FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests


FROM openjdk:11-jdk-slim
COPY --from=build /target/DogsManagementSysttem-0.0.1-SNAPSHOT.jar DogsManagementSysttem.jar
CMD ["java", "-jar", "DogsManagementSysttem.jar"]
