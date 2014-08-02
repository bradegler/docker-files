FROM bradegler/base

ENV GOPATH /data
ENV PATH .:/usr/local/go/bin:$PATH

VOLUME /data

RUN wget -qO- http://golang.org/dl/go1.3.linux-amd64.tar.gz | tar -C /usr/local -xzf -

CMD ["/bin/bash"]
