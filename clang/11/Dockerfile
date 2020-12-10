FROM ubuntu:20.04 as base

ENV CMAKE_VERSION=3.19.1

COPY sha256.txt .

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common \
        gpg-agent \
        wget && \
    wget https://apt.llvm.org/llvm-snapshot.gpg.key && \
    apt-key add llvm-snapshot.gpg.key && \
    rm -f llvm-snapshot.gpg.key && \
    apt-add-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-11 main" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        openssh-client \
        procps \
        build-essential \
        clang-11 \
        clang-format-11 \
        clang-tidy-11 \
        clang-tools-11 \
        libclang-11-dev \
        libclang-common-11-dev \
        libclang1-11 \
        libllvm11 \
        lld-11 \
        llvm-11 \
        llvm-11-tools \
        llvm-11-runtime \
        libc++-11-dev \
        libc++1-11 \
        libc++abi-11-dev \
        libc++abi1-11 \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-11        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-11      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-11 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-11   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-11      10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-11 image."
