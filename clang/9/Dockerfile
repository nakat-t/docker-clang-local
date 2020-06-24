FROM ubuntu:18.04 as base

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-9 \
        clang-format-9 \
        clang-tidy-9 \
        clang-tools-9 \
        libclang-9-dev \
        libclang-common-9-dev \
        libclang1-9 \
        libllvm9 \
        lld-9 \
        llvm-9 \
        llvm-9-tools \
        llvm-9-runtime \
        libc++-9-dev \
        libc++1-9 \
        libc++abi-9-dev \
        libc++abi1-9 \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-9        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-9      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-9 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-9   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-9      10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-9 image."
