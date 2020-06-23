FROM ubuntu:18.04
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-8 image."

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-8 \
        clang-format-8 \
        clang-tidy-8 \
        clang-tools-8 \
        libclang-8-dev \
        libclang-common-8-dev \
        libclang1-8 \
        libllvm8 \
        lld-8 \
        llvm-8 \
        llvm-8-tools \
        llvm-8-runtime \
        libc++-8-dev \
        libc++1-8 \
        libc++abi-8-dev \
        libc++abi1-8 \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-8        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-8      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-8 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-8   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-8      10

WORKDIR /data
