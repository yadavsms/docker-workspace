# hadoop-docker

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
cd master
docker build  -t yadavsms/hadoop-master .
```
and
```
cd slave
docker build  -t yadavsms/hadoop-slave .  
```
# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull yadavsms/hadoop-master

docker pull yadavsms/hadoop-slave
```

# Start a container

In order to use the Docker image you have just build or pulled use:

To start namenode

```
docker run --net=host -e HADOOP_MASTER_IP=<hadoop master ip> hadoop-master
```

To start datanode

```
docker run --net=host -e HADOOP_MASTER_IP=<hadoop master ip> hadoop-slave
```
