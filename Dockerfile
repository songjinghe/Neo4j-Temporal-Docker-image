FROM n3ziniuka5/ubuntu-oracle-jdk:14.04-JDK8
MAINTAINER Jinghe Song <support@daocloud.io>
RUN apt-get update
RUN apt-get install graphviz maven nodejs-legacy npm make devscripts debhelper rpm unzip
ADD settings.xml /etc/maven/settings.xml
RUN mkdir -p /opt/neo4j
WORKDIR /opt/neo4j
RUN wget https://github.com/neo4j/neo4j/archive/2.3.zip
RUN unzip 2.3.zip
RUN 

EXPOSE 7474
