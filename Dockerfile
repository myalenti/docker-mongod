#Dockerizing MongoDB attempt
#Based on Centos
MAINTAINER Mark Yalenti - MongoDB

#FROM centos:latest
FROM centos:6
ENV PATH $PATH:/opt/mongodb-mms-automation/bin
RUN yum update -y
RUN yum install -y net-tools which ksh net-snmp gcc gcc-devel openssl openssh-server
RUN cd /var/tmp
