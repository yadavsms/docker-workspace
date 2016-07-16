#Purpose:Docker Spark Master Image
#Author: Somesh Yadav
#pull ubuntu latest image from docker hub
FROM ubuntu:latest

MAINTAINER Somesh Yadav<yadavsms@gmail.com>


#
ENV SPARK_VERSION 1.3.1
ENV HADOOP_VERSION 2.6
#update ubuntu repo
RUN apt-get update

#add ppa for oracle java 7 or 8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

#update ubuntu repo
RUN apt-get update


#Accept java license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#install oracle java8
RUN apt-get install oracle-java8-installer curl -y

RUN curl -s http://mirrors.advancedhosters.com/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz | tar -xz -C / 
RUN ln -s /spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION  /spark

ADD ./run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/run.sh"]
