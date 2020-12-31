FROM openjdk:8
ADD target/config-server.jar config-server.jar
COPY ./target/config-server.jar .
WORKDIR .
ARG JAR_FILE
RUN sh -c 'touch config-server.jar'
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "config-server.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
#ADD target/lib           /usr/share/myservice/lib
# Add the service itself
#ADD target/${JAR_FILE} /usr/share/myservice/myservice.jar
