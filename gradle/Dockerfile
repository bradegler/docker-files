FROM bradegler/java8
MAINTAINER Brad Egler "begler@gmail.com"

WORKDIR /tmp

RUN wget https://services.gradle.org/distributions/gradle-2.2.1-all.zip && \
    unzip gradle-2.2.1-all.zip && \
    rm gradle-2.2.1-all.zip && \
    mv gradle-2.2.1 /opt && \
    ln -s /opt/gradle-2.2.1/bin/gradle /usr/bin

CMD ["/bin/bash"]
