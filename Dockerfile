FROM maven:latest AS maven
LABEL maintainer="Julia Pampus <julia.pampus@isst.fraunhofer.de>"

COPY pom.xml /tmp/

WORKDIR tmp
RUN mvn verify clean --fail-never

COPY src /tmp/src/

RUN mvn clean package -DskipTests -Dmaven.javadoc.skip=true

FROM adoptopenjdk/openjdk11:jre-11.0.8_10-alpine
RUN mkdir /app && chmod ugo+rwx /app
RUN mkdir /app/target && chmod ugo+rwx /app/target
RUN mkdir /app/target/db && chmod ugo+rwx /app/target/db
RUN mkdir /app/target/db/resources && chmod ugo+rwx /app/target/db/resources

COPY --from=maven /tmp/target/*.jar /app/app.jar

WORKDIR /app/

ENTRYPOINT ["java","-jar","app.jar"]
