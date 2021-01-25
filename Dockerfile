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
RUN apt-get update

#intalacion de npm
RUN apt install -y npm git

#instalar gradle
RUN curl -s "https://get.sdkman.io" | bash
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh"
RUN apt-get update
RUN sdk install gradle 6.8.1 

RUN git clone https://github.com/belenrickmers/pep3tingeso.git
WORKDIR /pep3tingeso/frontenddos/
RUN npm install
RUN npm install axios
RUN npm run serve

WORKDIR /pep3tingeso/backend/
RUN gradle build
RUN gradlew bootrun



