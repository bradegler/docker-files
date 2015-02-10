FROM bradegler/ruby
MAINTAINER Brad Egler "begler@gmail.com"

# Install Redis.
RUN \
  cd /tmp && \
  wget https://github.com/antirez/redis/archive/3.0.0-rc1.tar.gz && \
  tar xvzf 3.0.0-rc1.tar.gz && \
  cd redis-3.0.0-rc1 && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/appendonly no/appendonly yes/' /etc/redis/redis.conf 

# Enable clustering
RUN echo "cluster-enabled yes" >> /etc/redis/redis.conf
RUN echo "cluster-config-file nodes.conf" >> /etc/redis/redis.conf
RUN echo "cluster-node-timeout 5000" >> /etc/redis/redis.conf

RUN echo "[program:redis]" > /etc/supervisor/conf.d/redis.conf && \
    echo "command = redis-server /etc/redis/redis.conf" >> /etc/supervisor/conf.d/redis.conf && \
    echo "user = root" >> /etc/supervisor/conf.d/redis.conf && \
    echo "autostart = true" >> /etc/supervisor/conf.d/redis.conf

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports.
EXPOSE 6379 16379

# Define default command.
CMD ["/usr/bin/supervisord"]