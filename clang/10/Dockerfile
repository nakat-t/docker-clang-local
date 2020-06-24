FROM ubuntu:20.04 as base

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-10 \
        clang-format-10 \
        clang-tidy-10 \
        clang-tools-10 \
        libclang-10-dev \
        libclang-common-10-dev \
        libclang1-10 \
        libllvm10 \
        lld-10 \
        llvm-10 \
        llvm-10-tools \
        llvm-10-runtime \
        libc++-10-dev \
        libc++1-10 \
        libc++abi-10-dev \
        libc++abi1-10 \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-10        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-10      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-10   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-10      10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-10 image."
