FROM amazonlinux:latest

RUN yum install -y gcc gcc-c++ freetype-devel yum-utils findutils openssl-devel libffi-devel bzip2-devel sqlite-devel \
  && yum -y groupinstall development

RUN curl https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tar.xz | tar -xJ \
  && cd Python-3.7.10 \
  && ./configure --prefix=/usr/local --enable-shared \
  && make \
  && make install \
  && cd .. \
  && rm -rf Python-3.7.10

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

RUN pip3 install --upgrade pip