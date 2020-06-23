FROM ubuntu:16.04
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-4.0 image."

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-4.0 \
        clang-format-4.0 \
        clang-tidy-4.0 \
        libclang-4.0-dev \
        libclang-common-4.0-dev \
        libclang1-4.0 \
        libclang1-4.0-dbg \
        libllvm4.0 \
        libllvm4.0-dbg \
        lld-4.0 \
        llvm-4.0 \
        llvm-4.0-tools \
        llvm-4.0-runtime \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-4.0        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-4.0      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-4.0 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-4.0   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-4.0      10

WORKDIR /data
