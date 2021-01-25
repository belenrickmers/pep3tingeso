FROM ubuntu:18.04
RUN apt-get update

#instalacion de java
RUN sudo apt install -y default-jre
RUN sudo apt install -y default-jdk 

#instalacion de node
RUN sudo apt-get install -y curl 
RUN curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

#intalacion de npm
RUN sudo apt install -y npm git

#instalar gradle
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"
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



