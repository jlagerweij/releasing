FROM adoptopenjdk/openjdk11:alpine

# JRE fails to load fonts if there are no standard fonts in the image; DejaVu is a good choice,
# see https://github.com/docker-library/openjdk/issues/73#issuecomment-207816707
RUN apk add --update ttf-dejavu curl unzip && rm -rf /var/cache/apk/*

# Remove unneeded packages
RUN apk del curl unzip

WORKDIR /app
COPY build/libs/releasing*.jar /app/app.jar
COPY docker/entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
