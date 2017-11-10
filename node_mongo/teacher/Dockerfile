#centOS6 based Container with Apache
FROM centos:centos6
MAINTAINER kazu

#Install ssh-clients
RUN yum install -y openssh-clients

RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

COPY *.sh /

RUN chmod +x *.sh
