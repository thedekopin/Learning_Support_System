FROM centos:centos6
MAINTAINER kazu

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - 
RUN yum install -y nodejs gcc-c++ make
RUN yum install -y vim
ADD mongodb-org-3.4.repo /etc/yum.repos.d
RUN yum -y install mongodb-org

RUN useradd teacher 
RUN echo "teacher:rehcaet" | chpasswd
RUN su teacher
RUN mkdir -p home/teacher/web
COPY web home/teacher/web
#CMD npm install home/teacher/web/package.json
#CMD home/teacher/web/DEBUG=web* npm start
