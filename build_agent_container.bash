#!/bin/bash

CONTAINER_UUID=`uuidgen`

docker build -rm -t rackspace-monitoring-agent .
docker run rackspace-monitoring-agent echo ${CONTAINER_UUID}
CONTAINER=`docker ps -a --no-trunc |grep ${CONTAINER_UUID}|awk '{print $1}'|head -n1`
docker export ${CONTAINER} | xz > rackspace-monitoring-agent-container.tar.xz
