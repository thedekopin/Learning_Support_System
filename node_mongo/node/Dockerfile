FROM centos:centos6
MAINTAINER kazu

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - 
RUN yum install -y nodejs gcc-c++ make

ADD mongodb-org-3.4.repo /etc/yum.repos.d
RUN yum -y install mongodb-org
