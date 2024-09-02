#FROM openjdk:17-alpine3.14
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#
#ENTRYPOINT ["java","-jar","/app.jar"]

# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:17-alpine3.14

# Set the argument for the jar file
ARG JAR_FILE=target/*.jar

# Copy the jar file from the build stage
COPY --from=build /app/${JAR_FILE} app.jar

# Entry point for the application
ENTRYPOINT ["java","-jar","/app.jar"]