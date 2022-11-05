FROM maven as build
WORKDIR /app
COPY . . 
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /target/Uber.jar /app/
EXPOSE 90:90
CMD ["java","jar","Uber.jar"]
