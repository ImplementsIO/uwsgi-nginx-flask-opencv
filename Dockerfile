FROM tiangolo/uwsgi-nginx-flask:flask-python3.5

MAINTAINER wj.jiang <wj.jiang@outlook.com>
LABEL version="1.0"

RUN apt-get update \
    && apt-get install -y cmake gearman libgearman-dev

# build opencv

RUN mkdir build \
    && cd /build \
    && wget https://github.com/opencv/opencv/archive/3.1.0.tar.gz -O - | tar xzf - \
    && cd /build/opencv-3.1.0 \
    && cmake . -DWITH_IPP=OFF && make && make install \
    && rm -rf /build
   
RUN apt-get clean && apt-get autoclean
