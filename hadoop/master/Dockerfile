#Purpose:Docker Hadoop Master Image
#Author: Somesh Yadav
#pull ubuntu latest image from docker hub
FROM ubuntu:14.04

MAINTAINER Somesh Yadav<somesh.yadav@imaginea.com>

USER root

RUN apt-get update
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-installer openssh-server curl -y

RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.6.0 hadoop

RUN mkdir -p /mnt/hdfs/{tmp,namenode,datanode}

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop


ADD ./core-site.xml.template $HADOOP_PREFIX/etc/hadoop/core-site.xml.template

ADD ./hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml

ADD ./yarn-site.xml $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

ADD ./hadoop-env.sh $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

RUN chmod +x $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

RUN $HADOOP_PREFIX/bin/hdfs namenode -format

ADD ./run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/run.sh", "-d"]
