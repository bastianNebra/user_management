FROM maven:3.9.4-eclipse-temurin-11 AS build

WORKDIR /app

COPY . ./

RUN mvn clean package

EXPOSE 9082

RUN mvn liberty:dev
