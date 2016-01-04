FROM n3ziniuka5/ubuntu-oracle-jdk:14.04-JDK8

MAINTAINER Jinghe Song <support@daocloud.io>

RUN apt-get update && apt-get install -y \
  graphviz maven nodejs-legacy npm make devscripts debhelper rpm unzip

ADD settings.xml /etc/maven/settings.xml
ENV MAVEN_OPTS '-Xmx512m -XX:MaxPermSize=256m'
VOLUME /root/.m2

EXPOSE 7474

RUN mkdir -p /opt/neo4j
WORKDIR /opt/neo4j
RUN wget https://github.com/neo4j/neo4j/archive/2.3.zip
RUN unzip -qq 2.3.zip
WORKDIR /opt/neo4j/neo4j-2.3
RUN mvn clean install -DminimalBuild
WORKDIR /opt/neo4j/neo4j-2.3/community/server
CMD mvn clean compile exec:java
#ENTRYPOINT ['mvn', 'clean', 'compile', 'exec:java']

