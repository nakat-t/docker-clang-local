FROM ubuntu:20.04 as base

ENV CLANG_VERSION=12
ENV CMAKE_VERSION=3.19.1

COPY sha256.txt .

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common \
        gpg-agent \
        wget \
        ca-certificates \
        openssh-client \
        procps \
        build-essential \
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
    && wget https://apt.llvm.org/llvm.sh \
    && chmod +x llvm.sh \
    && ./llvm.sh ${CLANG_VERSION} all \
    && rm llvm.sh \
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

RUN    update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-${CLANG_VERSION}        10 \
    && update-alternatives --install /usr/bin/clang++      clang++      /usr/bin/clang++-${CLANG_VERSION}      10 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-${CLANG_VERSION} 10 \
    && update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-${CLANG_VERSION}   10 \
    && update-alternatives --install /usr/bin/llvm-ar      llvm-ar      /usr/bin/llvm-ar-${CLANG_VERSION}      10 \
    && update-alternatives --install /usr/bin/lldb         lldb         /usr/bin/lldb-${CLANG_VERSION}         10 \
    && update-alternatives --remove-all cc  \
    && update-alternatives --remove-all c++ \
    && update-alternatives --install /usr/bin/cc           cc           /usr/bin/clang   10 \
    && update-alternatives --install /usr/bin/c++          c++          /usr/bin/clang++ 10

WORKDIR /data

FROM base as test
COPY run_tests.sh /
RUN chmod +x /run_tests.sh

FROM base as release
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-${CLANG_VERSION} image."
