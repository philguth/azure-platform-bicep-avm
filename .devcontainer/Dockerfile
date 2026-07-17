FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        git-lfs \
    && curl -L https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64 -o /usr/local/bin/bicep \
    && chmod +x /usr/local/bin/bicep \
    && rm -rf /var/lib/apt/lists/*
