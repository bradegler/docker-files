FROM bradegler/java8
MAINTAINER Brad Egler "begler@gmail.com"

WORKDIR /tmp
RUN wget http://downloads.typesafe.com/typesafe-activator/1.2.10/typesafe-activator-1.2.10.zip && \
    unzip typesafe-activator-1.2.10.zip && \
    rm typesafe-activator-1.2.10.zip && \
    mv activator-1.2.10 /usr/local/lib && \
    ln -s /usr/local/lib/activator-1.2.10/activator /usr/local/bin/activator

RUN wget http://downloads.typesafe.com/scala/2.11.4/scala-2.11.4.tgz && \
    tar xvzf scala-2.11.4.tgz && \
    rm scala-2.11.4.tgz && \
    mv scala-2.11.4 /usr/local/lib/

RUN wget https://dl.bintray.com/sbt/debian/sbt-0.13.6.deb && \
    dpkg -i sbt-0.13.6.deb && \
    rm sbt-0.13.6.deb

VOLUME /data

CMD ["/bin/bash"]
