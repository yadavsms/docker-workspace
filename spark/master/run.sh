#!/bin/bash

export SPARK_HOME=/spark
#export SPARK_MASTER_IP=`ifconfig  eth0| grep "inet addr:" | awk '{ print $2}' | cut -d':' -f2`
$SPARK_HOME/sbin/start-master.sh --ip=$SPARK_MASTER_IP
tail -f $SPARK_HOME/logs/spark--org.apache.spark.deploy.master.Master-*-$HOSTNAME.out
