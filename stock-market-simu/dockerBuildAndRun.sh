#!/bin/bash -x

cat << EOF

   #############################################################
   ##                                                         ##
   ##  In the current version I do NOT use volumes for        ##
   ##  Consul Server.                                         ##
   ##                                                         ##
   ##  I'm using a local volume for Consul which brings       ##
   ##  problems during restart.                               ##                         
   ##  "$CONSUL_HOST_VOLUME/raft/peers.json" has to be        ##
   ##  deleted on Consul restart (re-elect Quorum)!           ##
   ##  https://www.consul.io/docs/guides/outage.html          ##
   ##                                                         ##
   #############################################################
	
EOF

#docker kill consul
#docker rm consul
## With a volume created on your local machine (host)
#export CONSUL_HOST_VOLUME=/var/data/consul/data
#mkdir -p $CONSUL_HOST_VOLUME
#rm -f $CONSUL_HOST_VOLUME/raft/peers.json
#docker run --name=consul --network=bridge -itd -p 8400:8400 -p 8500:8500 -p 8600:53/udp -v $CONSUL_HOST_VOLUME:/data -h node1 progrium/consul -server -bootstrap -ui-dir /ui

## Without a volume on the host
docker run --name=consul --network=bridge -itd -p 8400:8400 -p 8500:8500 -p 8600:53/udp  -h node1 progrium/consul -server -bootstrap -ui-dir /ui


cat << EOF

	
   #############################################################
   ##                                                         ##
   ##  Building the Docker image for the application:         ##
   ##                                                         ##
   ##  consul-spring-boot                                     ##
   ##                                                         ##
   #############################################################

EOF
mvn clean install -DskipTests
## If this script is executed with sudo change the owner to your user e.g. "frank" or start Eclipse with root. 
## Otherwise there could be a poblem to delete or override the target fodler content from Eclipse.
#chown "frank":"frank" target -R


cat << EOF

   #############################################################
   ##                                                         ##
   ##  Add key/value to Consul for the stages:                ##
   ##                                                         ##
   ##  dev                                                    ##
   ##  test                                                   ##
   ##  uat                                                    ##
   ##  prod                                                   ##
   ##                                                         ##
   #############################################################

EOF

## Stage: dev
curl -X PUT -d 'DEV:stock-market-simu' http://localhost:8500/v1/kv/dev/stock-market-simu/base/info/deployed/application
curl -X PUT -d 'dev' http://localhost:8500/v1/kv/dev/stock-market-simu/base/info/deployed/stage
curl -X PUT -d 'http://172.17.0.1:8080/' http://localhost:8500/v1/kv/dev/stock-market-simu/master/data/exchange/rs

## Stage: test
curl -X PUT -d 'TEST:stock-market-simu' http://localhost:8500/v1/kv/test/stock-market-simu/base/info/deployed/application
curl -X PUT -d 'test' http://localhost:8500/v1/kv/test/stock-market-simu/base/info/deployed/stage
curl -X PUT -d 'http://172.17.0.1:8080/' http://localhost:8500/v1/kv/test/stock-market-simu/master/data/exchange/rs

## Stage: uat
curl -X PUT -d 'UAT:stock-market-simu' http://localhost:8500/v1/kv/uat/stock-market-simu/base/info/deployed/application
curl -X PUT -d 'uat' http://localhost:8500/v1/kv/uat/stock-market-simu/base/info/deployed/stage
curl -X PUT -d 'http://172.17.0.1:8080/' http://localhost:8500/v1/kv/uat/stock-market-simu/master/data/exchange/rs

## Stage: prod
curl -X PUT -d 'stock-market-simu' http://localhost:8500/v1/kv/prod/stock-market-simu/base/info/deployed/application
curl -X PUT -d 'prod' http://localhost:8500/v1/kv/prod/stock-market-simu/base/info/deployed/stage
curl -X PUT -d 'http://172.17.0.1:8080/' http://localhost:8500/v1/kv/prod/stock-market-simu/master/data/exchange/rs

cat << EOF

	
   #############################################################
   ##                                                         ##
   ##  Start application "master-data-app"                    ##
   ##  for stages:                                            ##
   ##                                                         ##
   ##  dev  (8180)                                            ##
   ##  test (8181)                                            ##
   ##  uat  (8182)                                            ##
   ##  prod (8183)                                            ##
   ##                                                         ##
   #############################################################

EOF

docker run -d \
  --name=registrator \
  --net=host \
  --volume=/var/run/docker.sock:/tmp/docker.sock \
gliderlabs/registrator:latest \
consul://172.17.0.1:8500

## Stage: dev
docker kill stock-market-simu-dev
docker rm stock-market-simu-dev
docker run -dit -p 8180:8080 -e"STAGE=dev" -e"CONSUL_NODE=172.17.0.1:8500" --name=stock-market-simu-dev --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT
## Stage: test
#docker kill stock-market-simu-test
#docker rm stock-market-simu-test
#docker run -itd -p 8181:8080 -e"STAGE=test" -e"CONSUL_NODE=172.17.0.1:8500" --name=stock-market-simu-test --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT
## Stage: uat
#docker kill stock-market-simu-uat
#docker rm stock-market-simu-uat
#docker run -itd -p 8182:8080 -e"STAGE=uat" -e"CONSUL_NODE=172.17.0.1:8500" --name=stock-market-simu-uat --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT
## Stage: prod
#docker kill stock-market-simu-prod
#docker rm stock-market-simu-prod
#docker run -itd -p 8183:8080 -e"STAGE=prod" -e"CONSUL_NODE=172.17.0.1:8500" --name=stock-market-simu-prod --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT

cat << EOF

	
   #############################################################
   ##                                                         ##
   ##  Let Docker some time to start the container before     ##
   ##  testing with e.g. POSTMAN                              ##
   ##                                                         ##
   ##  dev  (8180)                                            ##
   ##  test (8181)                                            ##
   ##  uat  (8182)                                            ##
   ##  prod (8183)                                            ##
   ##                                                         ##
   ##  My machine need around 30s to set up.                  ##
   ##                                                         ##
   ##  i7-7500U 2.70GHz XPS13 9360 (64-bit)                   ##
   ##  16.0 GB                                                ##
   ##                                                         ##
   ##  ...so please WAIT?!                                    ##
   ##                                                         ##
   #############################################################

EOF

sleep 10s

cat << EOF

	
   #############################################################
   ##                                                         ##
   ##  ....READY!                                             ##
   ##                                                         ##
   #############################################################

EOF

docker ps

docker exec -it stock-market-simu-dev bash

