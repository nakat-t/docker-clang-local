FROM ubuntu:16.04 as base

ENV CMAKE_VERSION=3.19.1

COPY sha256.txt .

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
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
        wget \
        libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz \
    && sha256sum -c sha256.txt \
    && tar -xzf cmake-${CMAKE_VERSION}.tar.gz \
    && cd cmake-${CMAKE_VERSION} \
    && ./bootstrap \
    && make \
    && make install \
    && cd .. \
    && rm -f cmake-${CMAKE_VERSION}.tar.gz \
    && rm -rf cmake-${CMAKE_VERSION}

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-4.0        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-4.0      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-4.0 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-4.0   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-4.0      10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-4.0 image."
