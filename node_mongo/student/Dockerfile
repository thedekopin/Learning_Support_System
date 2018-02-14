#CentOS6 based Container with Apache
FROM centos:centos6
MAINTAINER kazu

RUN cp /etc/sysconfig/clock /etc/sysconfig/clock.org
RUN echo -e 'ZONE="Asia/Tokyo"\nUTC=false' > /etc/sysconfig/clock
RUN cp /etc/localtime /etc/localtime.org
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY .bashrc ~

RUN yum -y install epel-release
RUN yum -y install openssh-server

RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN service sshd start

RUN passwd -d root
RUN echo 'root:root' | chpasswd

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - 
RUN yum install -y nodejs gcc-c++ make vim git rsync xinetd
RUN yum install -y https://centos6.iuscommunity.org/ius-release.rpm
RUN ln -s /usr/bin/python3.6 /usr/bin/python3
RUN ln -s /usr/bin/pip3.6 /usr/bin/pip3
RUN yum install -y python36*
RUN pip3 install pymongo pexpect
RUN yum -y install inotify-tools
COPY ./inotify/inotify.js /inotify/

COPY inotify/* /inotify/

COPY inotifyd /etc/rc.d/init.d/
RUN chmod +x /etc/rc.d/init.d/inotifyd
RUN chkconfig --add inotifyd
RUN chkconfig inotifyd on

RUN etc/rc.d/init.d/xinetd start
RUN chkconfig xinetd on

EXPOSE 22

CMD /sbin/init
