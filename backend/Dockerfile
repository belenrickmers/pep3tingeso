FROM openjdk:15
COPY /pep3tingeso/backend/ backend

RUN chmod +x gradlew
RUN ./gradlew assemble
RUN ./gradlew bootrun

EXPOSE 1818