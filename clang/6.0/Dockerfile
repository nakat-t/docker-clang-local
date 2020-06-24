FROM ubuntu:18.04 as base

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-6.0 \
        clang-format-6.0 \
        clang-tidy-6.0 \
        clang-tools-6.0 \
        libclang-6.0-dev \
        libclang-common-6.0-dev \
        libclang1-6.0 \
        libclang1-6.0-dbg \
        libllvm6.0 \
        libllvm6.0-dbg \
        lld-6.0 \
        llvm-6.0 \
        llvm-6.0-tools \
        llvm-6.0-runtime \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-6.0        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-6.0      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-6.0 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-6.0   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-6.0      10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-6.0 image."
