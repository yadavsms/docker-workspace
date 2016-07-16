#!/bin/bash

export SPARK_HOME=/spark
$SPARK_HOME/sbin/start-slave.sh 1 "spark://$SPARK_MASTER_IP:7077" -i $SPARK_WORKER_IP 

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
