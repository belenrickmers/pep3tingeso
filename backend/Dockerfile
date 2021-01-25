
FROM openjdk:15

COPY . .

RUN ./gradlew build


RUN chmod +x docker-entrypoint.sh


ENTRYPOINT ["bash", "docker-entrypoint.sh"]