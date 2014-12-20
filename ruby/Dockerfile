FROM bradegler/base
MAINTAINER Brad Egler "begler@gmail.com"

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

RUN curl -sSL https://get.rvm.io | bash -s stable --rails

RUN echo source /etc/profile.d/rvm.sh >> /root/.bashrc

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/bin/bash"]