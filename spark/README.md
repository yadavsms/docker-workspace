# spark-docker

#build the image

For Spark Master
```
cd master
docker build -t spark-master .
```
For Spark Slave

```
cd slave
docker build -t spark-slave .
```

OR
#pull the images
```
docker pull yadavsms/spark-master
docker pull yadavsms/spark-slave
```

#Start the container
To Start master

```
docker run --net=host -e SPARK_MASTER_IP=<spark master ip> -d spark-master
```

To Start Worker
```
docker run --net=host -e SPARK_MASTER_IP=<spark master ip> -e SPARK_WORKER_IP=<spark worker ip> -d spark-slave
```
