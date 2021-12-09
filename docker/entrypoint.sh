#!/bin/bash

if [[ "${JAVA_ENABLE_DEBUG}" == "true" ]]; then
  echo "Java debug mode is ENABLED"
  exec java \
  -Dorg.apache.activemq.SERIALIZABLE_PACKAGES=java.lang,javax.security,java.util,org.apache.activemq,org.fusesource.hawtbuf,com.thoughtworks.xstream.mapper \
  -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=10001 \
  -jar \
  -XX:MaxRAMPercentage=50.0 \
  /app/app.jar
else
  echo "Java debug mode is DISABLED"
  exec java \
  -Dorg.apache.activemq.SERIALIZABLE_PACKAGES=java.lang,javax.security,java.util,org.apache.activemq,org.fusesource.hawtbuf,com.thoughtworks.xstream.mapper \
  -jar \
  -XX:MaxRAMPercentage=50.0 \
  /app/app.jar
fi
