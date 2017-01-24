#Dockerizing MongoDB attempt
#Based on Centos

#FROM centos:latest
FROM centos:6
MAINTAINER Mark Yalenti - MongoDB
ENV PATH $PATH:/opt/mongodb-mms-automation/bin
RUN yum update -y
RUN yum install -y net-tools which ksh net-snmp gcc gcc-devel openssl openssh-server
WORKDIR /opt
#RUN curl -OL http://downloads.10gen.com/linux/mongodb-linux-x86_64-enterprise-rhel62-3.2.8.tgz
#RUN tar xvfz mongodb-linux-x86_64-enterprise-rhel62-3.2.8.tgz
RUN curl -OL https://downloads.mongodb.com/linux/mongodb-linux-x86_64-enterprise-rhel62-3.4.1.tgz
RUN tar xvfz mongodb-linux-x86_64-enterprise-rhel62-3.4.1.tgz
RUN mkdir -p /data/db
RUN groupadd mongod
RUN useradd -g mongod mongod
ADD mongod.conf /data/db/mongod.conf
RUN chown -R mongod:mongod /data
EXPOSE 27017
ENTRYPOINT [ "/opt/mongodb-linux-x86_64-enterprise-rhel62-3.4.1/bin/mongod", "-f",  "/data/db/mongod.conf" ] 
