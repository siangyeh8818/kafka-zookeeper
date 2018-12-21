#FROM openjdk:8u181-jre-alpine
FROM centos:7
RUN yum -y update  && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel curl
COPY kafka_2.12-2.1.0 /kafka_2.12-2.1.0
COPY run.sh /
WORKDIR /bin
RUN chmod +x /kafka_2.12-2.1.0/bin/*.sh
ENTRYPOINT ["sh","-c","/run.sh"]
