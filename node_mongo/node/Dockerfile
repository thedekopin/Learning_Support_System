FROM centos:centos6
MAINTAINER kazu

RUN cp /etc/sysconfig/clock /etc/sysconfig/clock.org
RUN echo -e 'ZONE="Asia/Tokyo"\nUTC=false' > /etc/sysconfig/clock
RUN cp /etc/localtime /etc/localtime.org
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY .bashrc ~/.bashrc

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

RUN yum install -y openssh-clients
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN chmod +x /home/teacher/web/public/shellscript/task.*/*.sh
