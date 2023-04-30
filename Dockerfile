#FROM java:8
#WORKDIR /app/
# Copiamos el JAR de nuestra aplicación a la imagen Docker
#COPY  target/spring-boot-web.jar .
# Corremos el archivo JAR
#CMD ["java", "jar", "spring-boot-web.jar", "app.Main"]
#####3
FROM openjdk:8-jre-alpine
ENV EXPOSED_PORT 8080
ADD target/spring-boot-web.jar . /usr/src/microservice/
WORKDIR /usr/src/microservice
EXPOSE $EXPOSED_PORT
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar","spring-boot-web.jar"]
