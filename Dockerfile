FROM maven:3.9.1-amazoncorretto-19-debian as build-1
WORKDIR /app
COPY . .
RUN mvn clean install 

FROM amazoncorretto:11-al2022-jdk
COPY --from=build-1 COPY /usr/src/app/target/gs-maven-0.1.0.jar /usr/app/gs-maven-0.1.0.jar
ENTRYPOINT ["java","-jar","/usr/app/gs-maven-0.1.0.jar"]

