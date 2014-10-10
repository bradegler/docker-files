FROM bradegler/base
MAINTAINER Brad Egler "begler@gmail.com"

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get -yq install oracle-java8-installer oracle-java8-set-default

CMD ["/bin/bash"]
