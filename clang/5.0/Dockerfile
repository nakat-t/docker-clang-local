FROM ubuntu:16.04
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local clang-5.0 image."

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openssh-client \
        procps \
        build-essential \
        clang-5.0 \
        clang-format-5.0 \
        clang-tidy-5.0 \
        libclang-5.0-dev \
        libclang-common-5.0-dev \
        libclang1-5.0 \
        libclang1-5.0-dbg \
        libllvm5.0 \
        libllvm5.0-dbg \
        lld-5.0 \
        llvm-5.0 \
        llvm-5.0-tools \
        llvm-5.0-runtime \
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

WORKDIR /data
