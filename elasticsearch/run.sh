#!/bin/sh

mkdir -p /tmp/elasticsearch
#cp elasticsearch.yml /tmp/elasticsearch/
docker run -i -t -P --rm --name elasticsearch -p 9200:9200 -p 9300:9300 -v /tmp/elasticsearch:/data/data bradegler/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
