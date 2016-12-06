FROM alpine:latest

RUN \
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
  && apk add --no-cache g++ make wget \
  && wget https://superb-sea2.dl.sourceforge.net/project/boost/boost/1.62.0/boost_1_62_0.tar.bz2 \
  && tar -bzip2 -xf boost_1_62_0.tar.bz2 \
  && cd boost_1_62_0 \
  && ./bootstrap.sh --prefix=/usr/local \
  && ./b2 install \
  && rm -rf boost_1_62_0.tar.bz2 boost_1_62_0

CMD ['/bin/sh']
