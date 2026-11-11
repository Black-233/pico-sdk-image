# containerfile
# author: melon

FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git cmake pkg-config bear \
    clangd clang-format \
    python3 bash ca-certificates curl \
    build-essential \
    gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib \
    ripgrep fd-find && \
    ln -sf "$(which fdfind)" /usr/local/bin/fd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["/bin/bash"]
