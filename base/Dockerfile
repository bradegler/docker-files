FROM ubuntu:trusty
MAINTAINER Brad Egler "begler@gmail.com"

# Fix the locale
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || :

# apt-get update because we _do_ need it :(
RUN apt-get -yq update

# Fix initctl, in case it hasn't been fixed already
RUN dpkg-divert --local --rename --add /sbin/initctl && rm -f /sbin/initctl && ln -s /bin/true /sbin/initctl

# Install some stuff I want by default
RUN apt-get -yq install git vim wget curl build-essential software-properties-common python-software-properties
RUN apt-get -yq install python python-dev python-pip python-virtualenv

# Quick clean-up to reduce the size of this image
RUN apt-get clean

CMD ["/bin/bash"]