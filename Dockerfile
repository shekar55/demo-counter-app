FROM Maven as build 
WORKDIR /app
COPY . . 
RUN mvn install

FROM openjdk:11.0
WORKDIR /app 
COPY --frombuild /app/target/Uber.jar /app/
EXPOSE 9000
CMD ["java","-jar","Uber.jar"]