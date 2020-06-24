FROM ubuntu:16.04 as base

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-3.9 \
        clang-format-3.9 \
        clang-tidy-3.9 \
        libclang-3.9-dev \
        libclang-common-3.9-dev \
        libclang1-3.9 \
        libclang1-3.9-dbg \
        libllvm3.9 \
        libllvm3.9-dbg \
        llvm-3.9 \
        llvm-3.9-tools \
        llvm-3.9-runtime \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-3.9        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-3.9      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-3.9 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-3.9   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-3.9      10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-3.9 image."
