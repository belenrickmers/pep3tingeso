FROM openjdk:15
COPY . .

RUN chmod +x gradlew
RUN ./gradlew assemble
RUN ./gradlew bootrun

EXPOSE 1818