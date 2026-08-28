FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive \
    DOTNET_SDK_VERSION=10.0.400 \
    BICEP_VERSION=0.46.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
    && curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR=/usr/local/bin sh \
    && curl -fsSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh \
    && bash /tmp/dotnet-install.sh --version "$DOTNET_SDK_VERSION" --install-dir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/local/bin/dotnet \
    && ln -s /usr/share/dotnet/dnx /usr/local/bin/dnx \
    && curl -fsSL "https://github.com/Azure/bicep/releases/download/v${BICEP_VERSION}/bicep-linux-x64" -o /usr/local/bin/bicep \
    && chmod +x /usr/local/bin/bicep \
    && rm -f /tmp/dotnet-install.sh \
    && rm -rf /var/lib/apt/lists/*
