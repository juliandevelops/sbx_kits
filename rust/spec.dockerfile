FROM docker.io/sbx/shell-image:latest
USER root
RUN apt-get update && apt-get install -y --no-install-recommends build-essential pkg-config && rm -rf /var/lib/apt/lists*
USER agent
ENV PATH="/home/agent/.cargo/bin:${PATH}"
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile default --default-toolchain stable && . "$HOME/.cargo/env" && rustup component add rust-analyzer
