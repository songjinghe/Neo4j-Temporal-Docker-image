FROM docker-ubuntu
MAINTAINER Jinghe Song <support@daocloud.io>
RUN apt-get update && apt-get install -y git subversion python-bottle emacs23-nox unzip
RUN echo "GatewayPorts=yes\n" >> /etc/ssh/sshd_config
