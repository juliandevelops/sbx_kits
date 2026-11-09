FROM docker.io/sbx/shell-image:latest
USER root
RUN apt-get update && apt-get install -y --no-install-recommends build-essential pgk-config && rm -rf /var/lib/apt/lists*
USER agent
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile default --default-toolchain stable && rustup component add rustfmt clippy rust-analyzer
