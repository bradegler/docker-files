#/bin/sh

ports=(7000 7001 7002 7003 7004 7005)

data_root=/tmp/redis

mkdir -p $data_root

for port in ${ports[@]};
do
    echo Starting node at port $port
    docker stop redis_$port
    docker rm redis_$port
    mkdir -p $data_root/$port
    docker run -d -P --name redis_$port -p $port:6379 -p 1$port:16379 -v $data_root/$port:/data bradegler/redis-cluster
done

echo "Configuring cluster"
docker run -i -P --rm bradegler/redis-cluster /tmp/redis-3.0.0-rc1/src/redis-trib.rb create --replicas 1 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005