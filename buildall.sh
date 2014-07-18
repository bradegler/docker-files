#!/bin/sh

docker build -t="bradegler/base" ./base
docker build -t="bradegler/chef" ./chef
docker build -t="bradegler/java" ./java
docker build -t="bradegler/jenkins" ./jenkins
docker build -t="bradegler/rabbitmq" ./rabbitmq
docker build -t="bradegler/mongodb" ./mongodb
docker build -t="bradegler/redis" ./redis
docker build -t="bradegler/wildfly" ./wildfly
docker build -t="bradegler/node" ./node