FROM artifactory.cloud.capitalone.com/cof-approved-images/apm:1.3-openjdk8-alpine3.10

ENV PROP_FILE /config/api.properties
ENV RELEASE_VERSON 3.4.19
WORKDIR /hygieia
RUN wget https://artifactory.cloud.capitalone.com/artifactory/list/maven-internalfacing/com/capitalone/dashboard/api/$RELEASE_VERSON/api-$RELEASE_VERSON.jar
RUN pwd
RUN ls -ltr
COPY /config/api.properties /hygieia/

RUN mkdir -p /hygieia/logs

RUN chown appuser:appuser -R /hygieia/logs

EXPOSE 8080

CMD java -jar *.jar --spring.config.location=$PROP_FILE
