FROM ubuntu:20.04

# RUN apt-get update\
#     && apt install software-properties-common\
#     && add-apt-repository ppa:deadsnakes/ppa\
#     && apt install python3.8\
#     && ln -s  /usr/bin/python3.8 /usr/bin/python\
#     && apt-get install build-essential tree ninja-build gcc-multilib g++-multilib lib32stdc++-9-dev flex bison xz-utils ruby ruby-dev python3-requests python3-setuptools python3-dev python3-pip libc6-dev libc6-dev-i386 -y\
#     && gem install fpm -v 1.11.0 --no-document\
#     && python3 -m pip install lief
COPY ./sources.list /etc/apt/
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update\
    && apt-get install wget unzip build-essential curl git lib32stdc++-9-dev \
    libc6-dev-i386 nodejs npm python3-dev python3-pip -y

RUN wget --no-check-certificate https://nodejs.org/download/release/v14.17.0/node-v14.17.0-linux-armv7l.tar.xz;\
    tar xvJf node-v14.17.0-linux-armv7l.tar.xz;\
    rm node-v14.17.0-linux-armv7l.tar.xz

RUN wget https://dl.google.com/android/repository/android-ndk-r22b-linux-x86_64.zip\
    && unzip android-ndk-r22b-linux-x86_64.zip

ENV PATH "/node-v14.17.0-linux-armv7l/bin:$PATH"
ENV ANDROID_NDK_ROOT "/android-ndk-r22b-linux-x86_64"

ARG FRIDA_ENV_DIR=/root/frida-env
WORKDIR ${FRIDA_ENV_DIR}
COPY patchs ${FRIDA_ENV_DIR}/patchs
COPY sh ${FRIDA_ENV_DIR}/scripts

RUN git config --global push.default simple\
    && git config --global user.name aaaa\
    && git config --global user.email aaaa@gmail.com
RUN git clone --recurse-submodules https://github.com/frida/frida