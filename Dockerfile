FROM debian:bullseye

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# change to aliyun
RUN sed -i "s@http://deb.debian.org@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        file \
        wget \
        cpio \ 
        unzip \
        rsync \ 
        bc \
        libncurses5-dev \
        git \
        sudo \
        vim \
        python3 \
        ca-certificates \
        gawk \
    && rm -rf /var/lib/apt/lists/* && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /build