
FROM openjdk:15

COPY . .

RUN ./gradlew build


COPY docker-entrypoint.sh /

RUN chmod +x docker-entrypoint.sh

WORKDIR /backend/build/libs

ENTRYPOINT ["bash", "docker-entrypoint.sh"]