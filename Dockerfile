FROM ubuntu:20.04

#COPY ./sources.list /etc/apt/
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update\
    && apt-get install ruby-dev wget unzip ninja-build build-essential curl git lib32stdc++-9-dev \
    libc6-dev-i386 nodejs npm python3-dev python3-pip -y

RUN gem install fpm -v 1.11.0 --no-document && python3 -m pip install lief

ENV NVM_DIR $HOME/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash\
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && nvm install 10


RUN wget https://dl.google.com/android/repository/android-ndk-r22b-linux-x86_64.zip\
    && unzip android-ndk-r22b-linux-x86_64.zip

ENV ANDROID_NDK_ROOT "/android-ndk-r22b"

ARG FRIDA_ENV_DIR=/root/frida-env
WORKDIR ${FRIDA_ENV_DIR}
COPY patchs ${FRIDA_ENV_DIR}/patchs
COPY sh ${FRIDA_ENV_DIR}/scripts

RUN git config --global push.default simple\
    && git config --global user.name aaaa\
    && git config --global user.email aaaa@gmail.com

RUN git clone --recurse-submodules https://github.com/frida/frida
RUN cd frida\
    && git checkout 14.2.3\
    && git submodule update --recursive
