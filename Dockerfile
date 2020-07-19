FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update -y
RUN apt-get install wget tar build-essential -y
RUN wget https://sourceforge.net/projects/asio/files/asio/1.16.1%20%28Stable%29/asio-1.16.1.tar.gz/download -O asio-1.16.1.tar.gz \
 && tar -zxvf  asio-1.16.1.tar.gz \
 && cd asio-1.16.1 \
 && ./configure \
 && make

RUN tar zcvf cpp11.tar.gz asio-1.16.1/src/examples/cpp11 \
 && mkdir /root/share

CMD ["cp", "cpp11.tar.gz", "share"]
