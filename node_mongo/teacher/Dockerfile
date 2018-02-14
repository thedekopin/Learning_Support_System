#centOS6 based Container with Apache
FROM centos:centos6
MAINTAINER kazu

RUN cp /etc/sysconfig/clock /etc/sysconfig/clock.org
RUN echo -e 'ZONE="Asia/Tokyo"\nUTC=false' > /etc/sysconfig/clock
RUN cp /etc/localtime /etc/localtime.org
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY .bashrc ~/.bashrc

#Install ssh-clients
RUN yum install -y openssh-clients

RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

COPY *.sh /

RUN chmod +x *.sh
