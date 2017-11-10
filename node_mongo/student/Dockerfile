#CentOS6 based Container with Apache
FROM centos:centos6
MAINTAINER kazu

RUN yum -y install epel-release
RUN yum -y install openssh-server

RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN service sshd start

RUN passwd -d root
RUN echo 'root:root' | chpasswd

RUN yum -y install inotify-tools

COPY inotifyd /etc/rc.d/init.d/
RUN chmod +x /etc/rc.d/init.d/inotifyd
RUN chkconfig --add inotifyd
RUN chkconfig inotifyd on

EXPOSE 22

CMD /sbin/init 
