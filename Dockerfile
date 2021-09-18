FROM java
ENV SUFFIX_NUM=${SUFFIX_NUM:-1}
ENV NACOS_ADDR=${NACOS_ADDR:-127.0.0.1:8848}
ENV SERVICE_NAME=${SERVICE_NAME:-gateway-service}
ENV NAMESPACE=${NAMESPACE}
ENV GROUP=${GROUP:-DEFAULT_GROUP}
COPY *.jar /app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar",\
            "--suffix.num=${SUFFIX_NUM}","--spring.cloud.nacos.discovery.server-addr=${NACOS_ADDR}",\
            "--spring.application.name=${SERVICE_NAME}","--spring.cloud.nacos.discovery.group=${GROUP}",\
            "--spring.cloud.nacos.discovery.namespace=${NAMESPACE}",\
            "--spring.cloud.nacos.discovery.port=${DISCOVERY_PORT}"]
EXPOSE 18001