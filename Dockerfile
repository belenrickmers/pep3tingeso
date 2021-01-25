FROM ubuntu:18.04
RUN apt-get update

#instalacion de java
RUN apt install -y default-jre
RUN apt install -y default-jdk 

#instalacion de node
RUN apt-get install -y curl
RUN apt-get install -y nodejs
RUN apt-get install unzip
RUN apt-get install zip
RUN apt-get install wget
RUN apt-get update

#intalacion de npm
RUN apt install -y npm git

#instalar gradle
RUN apt-get update

ARG JAVA_VERSION=15
ARG JAVA_RELEASE=JDK

ENV JAVA_HOME=/usr
RUN bash -c ' \
    set -euxo pipefail && \
    apt-get update && \
    pkg="openjdk-$JAVA_VERSION"; \
    if [ "$JAVA_RELEASE" = "JDK" ]; then \
        pkg="$pkg-jdk-headless"; \
    else \
        pkg="$pkg-jre-headless"; \
    fi; \
    apt-get install -y --no-install-recommends wget unzip "$pkg" && \
    apt-get clean'


CMD /bin/bash

#install Gradle
RUN wget -q https://services.gradle.org/distributions/gradle-6.8.1-bin.zip \
    && unzip gradle-6.8.1-bin.zip -d /opt \
    && rm gradle-6.8.1-bin.zip

# Set Gradle in the environment variables
ENV GRADLE_HOME /opt/gradle-6.8.1
ENV PATH $PATH:/opt/gradle-6.8.1/bin

RUN git clone https://github.com/belenrickmers/pep3tingeso.git
WORKDIR /pep3tingeso/frontenddos/
RUN npm install
RUN npm install axios
RUN npm run serve

WORKDIR /pep3tingeso/backend/
RUN gradle build
RUN gradlew bootrun



