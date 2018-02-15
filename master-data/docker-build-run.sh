#!/bin/bash -x

mvn clean install -DskipTests


## Stage: dev
curl -X PUT -d 'DEV:master-data-app' http://localhost:8500/v1/kv/dev/master-data-app/base/info/deployed/application
curl -X PUT -d 'dev' http://localhost:8500/v1/kv/dev/master-data-app/base/info/deployed/stage

## Stage: test
curl -X PUT -d 'TEST:master-data-app' http://localhost:8500/v1/kv/test/master-data-app/base/info/deployed/application
curl -X PUT -d 'test' http://localhost:8500/v1/kv/test/master-data-app/base/info/deployed/stage

## Stage: uat
curl -X PUT -d 'UAT:master-data-app' http://localhost:8500/v1/kv/uat/master-data-app/base/info/deployed/application
curl -X PUT -d 'uat' http://localhost:8500/v1/kv/uat/master-data-app/base/info/deployed/stage

## Stage: prod
curl -X PUT -d 'master-data-app' http://localhost:8500/v1/kv/prod/master-data-app/base/info/deployed/application
curl -X PUT -d 'prod' http://localhost:8500/v1/kv/prod/master-data-app/base/info/deployed/stage


CONSUL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-local-agent)

## Stage: instance 0
docker kill master-data-app.0
docker rm master-data-app.0
docker run -itd -p 8080 -e"STAGE=dev" -e"CONSUL_NODE=$CONSUL_IP:8500" --name master-data-app.0 --network=bridge avoodoo/master-data-app:1.0-SNAPSHOT
## Stage: instance 1
docker kill master-data-app.1
docker rm master-data-app.1
docker run -itd -p 8080 -e"STAGE=dev" -e"CONSUL_NODE=$CONSUL_IP:8500" --name master-data-app.1 --network=bridge avoodoo/master-data-app:1.0-SNAPSHOT
## Stage: instance 2
docker kill master-data-app.2
docker rm master-data-app.2
docker run -itd -p 8080 -e"STAGE=dev" -e"CONSUL_NODE=$CONSUL_IP:8500" --name master-data-app.2 --network=bridge avoodoo/master-data-app:1.0-SNAPSHOT
## Stage: instance 3
docker kill master-data-app.3
docker rm master-data-app.3
docker run -itd -p 8080 -e"STAGE=dev" -e"CONSUL_NODE=$CONSUL_IP:8500" --name master-data-app.3 --network=bridge avoodoo/master-data-app:1.0-SNAPSHOT


#sleep 10s

cat << EOF

	
   #############################################################
   ##                                                         ##
   ##  ....READY!                                             ##
   ##                                                         ##
   #############################################################

EOF
