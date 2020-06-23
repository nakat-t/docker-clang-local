FROM ubuntu:18.04
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-7 image."

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-7 \
        clang-format-7 \
        clang-tidy-7 \
        clang-tools-7 \
        libclang-7-dev \
        libclang-common-7-dev \
        libclang1-7 \
        libllvm7 \
        lld-7 \
        llvm-7 \
        llvm-7-tools \
        llvm-7-runtime \
        libc++-7-dev \
        libc++1-7 \
        libc++abi-7-dev \
        libc++abi1-7 \
        autoconf \
        automake \
        libtool \
        make \
        patch \
        file \
        git \
        subversion \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-7        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-7      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-7 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-7   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-7      10

WORKDIR /data
