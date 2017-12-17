#CentOS6 based Container with Apache
FROM centos:centos6
MAINTAINER kazu

RUN cp /etc/sysconfig/clock /etc/sysconfig/clock.org
RUN echo -e 'ZONE="Asia/Tokyo"\nUTC=false' > /etc/sysconfig/clock
RUN cp /etc/localtime /etc/localtime.org
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY .bashrc ~/.bashrc

RUN yum -y install epel-release
RUN yum -y install openssh-server

RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN service sshd start

RUN passwd -d root
RUN echo 'root:root' | chpasswd

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - 
RUN yum install -y nodejs gcc-c++ make
RUN yum install -y vim
RUN yum -y install inotify-tools
WORKDIR /inotify
RUN npm init
RUN npm install inotifywait
COPY test.js .

COPY inotifyd /etc/rc.d/init.d/
RUN chmod +x /etc/rc.d/init.d/inotifyd
RUN chkconfig --add inotifyd
RUN chkconfig inotifyd on

EXPOSE 22

CMD /sbin/init 
