FROM centos:centos6
MAINTAINER kazu

ADD mongodb-org-3.4.repo /etc/yum.repos.d
RUN yum -y install mongodb-org

RUN mkdir -p /data/db/mongodb
RUN sed -i "s/bindIpi/#bindIp/" /etc/mongod.conf

RUN mkdir -p /usr/local/mongodb/conf
RUN openssl rand -base64 741 > /usr/local/mongodb/conf/mongodb-keyfile
RUN chmod 600 /usr/local/mongodb/conf/mongodb-keyfile

RUN echo "security:" >> /etc/mongod.conf
RUN echo "  keyFile: /usr/local/mongodb/conf/mongodb-keyfile" >> /etc/mongod.conf
#RUN echo "  authorization: enabled" >> /etc/mongod.conf

CMD mongod --keyFile /usr/local/mongodb/conf/mongodb-keyfile --dbpath /data/db/mongodb
