FROM nvidia/cuda:11.0.3-base-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y build-essential git cmake

RUN git clone https://github.com/brichard19/BitCrack.git /BitCrack
WORKDIR /BitCrack

RUN mkdir build && cd build && cmake .. && make

CMD ["bash"]