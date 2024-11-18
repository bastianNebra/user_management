FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /user_management

COPY pom.xml ./
RUN mvn dependency:go-offline -B

COPY . ./

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /user_management

COPY --from=build /user_management/target/*.jar user_management.jar

EXPOSE 8080

CMD ["java", "-jar", "user_management.jar"]
