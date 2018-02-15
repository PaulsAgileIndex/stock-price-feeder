#!/bin/bash -x


mvn clean install -DskipTests

CONSUL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-local-agent)
HAPROXY_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' haproxy)

echo $CONSUL_IP
echo $HAPROXY_IP

## Stage: dev
curl -X PUT -d "DEV:stock-market-simu" http://$CONSUL_IP:8500/v1/kv/dev/stock-market-simu/base/info/deployed/application
curl -X PUT -d "dev" http://$CONSUL_IP:8500/v1/kv/dev/stock-market-simu/base/info/deployed/stage
curl -X PUT -d "http://$HAPROXY_IP:1080" http://$CONSUL_IP:8500/v1/kv/dev/stock-market-simu/master/data/exchange/rs

## Stage: test
curl -X PUT -d "TEST:stock-market-simu" http://$CONSUL_IP:8500/v1/kv/test/stock-market-simu/base/info/deployed/application
curl -X PUT -d "test" http://$CONSUL_IP:8500/v1/kv/test/stock-market-simu/base/info/deployed/stage
curl -X PUT -d "http://$HAPROXY_IP:1080" http://$CONSUL_IP:8500/v1/kv/test/stock-market-simu/master/data/exchange/rs

## Stage: uat
curl -X PUT -d "UAT:stock-market-simu" http://$CONSUL_IP:8500/v1/kv/uat/stock-market-simu/base/info/deployed/application
curl -X PUT -d "uat" http://$CONSUL_IP:8500/v1/kv/uat/stock-market-simu/base/info/deployed/stage
curl -X PUT -d "http://$HAPROXY_IP:1080" http://$CONSUL_IP:8500/v1/kv/uat/stock-market-simu/master/data/exchange/rs

## Stage: prod
curl -X PUT -d "stock-market-simu" http://$CONSUL_IP:8500/v1/kv/prod/stock-market-simu/base/info/deployed/application
curl -X PUT -d "prod" http://$CONSUL_IP:8500/v1/kv/prod/stock-market-simu/base/info/deployed/stage
curl -X PUT -d "http://${HAPROXY_IP}:1080" http://$CONSUL_IP:8500/v1/kv/prod/stock-market-simu/master/data/exchange/rs

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


CONSUL_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' consul-local-agent)

## Stage: dev
docker kill stock-market-simu-dev
docker rm stock-market-simu-dev
docker run -dit -p 8180:8080 -e"STAGE=dev" -e"CONSUL_NODE=$CONSUL_IP:8500" --name=stock-market-simu-dev --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT
## Stage: test
#docker kill stock-market-simu-test
#docker rm stock-market-simu-test
#docker run -itd -p 8181:8080 -e"STAGE=test" -e"CONSUL_NODE=$CONSUL_IP:8500" --name=stock-market-simu-test --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT
## Stage: uat
#docker kill stock-market-simu-uat
#docker rm stock-market-simu-uat
#docker run -itd -p 8182:8080 -e"STAGE=uat" -e"CONSUL_NODE=$CONSUL_IP:8500" --name=stock-market-simu-uat --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT
## Stage: prod
#docker kill stock-market-simu-prod
#docker rm stock-market-simu-prod
#docker run -itd -p 8183:8080 -e"STAGE=prod" -e"CONSUL_NODE=$CONSUL_IP:8500" --name=stock-market-simu-prod --network=bridge avoodoo/stock-market-simu:1.0-SNAPSHOT


#sleep 10s

cat << EOF

	
   #############################################################
   ##                                                         ##
   ##  ....READY!                                             ##
   ##                                                         ##
   #############################################################

EOF


