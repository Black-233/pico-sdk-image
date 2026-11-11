FROM ubuntu:24.04

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git cmake clangd clang-format python3 bash ca-certificates \
    curl build-essential gcc-arm-none-eabi \
    libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib \
    ripgrep fd-find && \
    ln -s $(which fdfind) /usr/local/bin/fd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace

WORKDIR /workspace

CMD ["/bin/bash"]
