# Use Ubuntu LTS for stability
FROM ubuntu:22.04

# Set environment to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install core dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install C/C++ toolchain
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    gdb \
    valgrind \
    clang \
    cmake \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (JavaScript) from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

# Install .NET SDK (C# and ASP.NET)
RUN apt-get update && \
    apt-get install -y \
    wget \
    && wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update && \
    apt-get install -y \
    dotnet-sdk-8.0 \
    aspnetcore-runtime-8.0 \
    && rm -rf /var/lib/apt/lists/*

# Install additional utilities
RUN apt-get update && \
    apt-get install -y \
    git \
    vim \
    nano \
    emacs \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
