FROM ubuntu:trusty
MAINTAINER Brad Egler "begler@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /home/dcuser
RUN groupadd -r dcuser -g 433 && \
    useradd -u 431 -r -g dcuser -d /home/dcuser -s /sbin/nologin -c "Docker image user" dcuser && \
    chown -R dcuser:dcuser /home/dcuser

# Fix the locale
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

# apt-get update because we _do_ need it :(
RUN apt-get -yq update

# Fix initctl, in case it hasn't been fixed already
RUN dpkg-divert --local --rename --add /sbin/initctl && rm -f /sbin/initctl && ln -s /bin/true /sbin/initctl

# Install some stuff I want by default
RUN apt-get -yq install git vim wget curl build-essential software-properties-common python-software-properties
RUN apt-get -yq install python python-dev python-pip python-virtualenv git-svn subversion mercurial

# Quick clean-up to reduce the size of this image
RUN apt-get clean

# Correct the timezone to eastern
RUN echo "America/New_York" tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

CMD ["/bin/bash"]
