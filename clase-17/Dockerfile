FROM maven:3.6.3-jdk-11-slim AS build

RUN mkdir /home/app
COPY . /home/app
RUN cd /home/app && mvn package

# Package stage
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/myproject-0.0.1-SNAPSHOT.jar /myproject.jar

EXPOSE 8080

CMD ["java", "-Delastic.apm.service_name=myproject -Delastic.apm.application_packages=com.example.myproject","-jar", "/myproject.jar"]

