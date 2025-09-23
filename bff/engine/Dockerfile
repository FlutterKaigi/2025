FROM ubuntu:24.04 AS build

RUN apt-get update && apt-get install -y \
    sudo curl git ca-certificates unzip jq bash sed wget xz-utils && \
	apt-get upgrade -y && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add user
RUN useradd -m -s /bin/bash -G sudo builder && \
	chown -R builder:builder /app

# Switch to the builder user
USER builder

# Install flutter
ARG FLUTTER_VERSION=3.36.0-0.1.pre-beta
RUN wget -q -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/beta/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz && \
    tar -xf flutter.tar.xz && \
    rm flutter.tar.xz && \
	mkdir -p ~/.local && \
    mv flutter ~/.local/flutter

# Set the path to the flutter binary
ENV PATH="~/.local/flutter/bin:$PATH"

COPY --chown=builder:builder . .

RUN dart pub get

# Build the application
RUN cd bff/engine && \
    mkdir -p build && \
    dart compile exe lib/main.dart -o build/main

# Use a minimal base image for the final stage.
# Debian 13: https://www.debian.org/releases/stable/
FROM debian:trixie-slim

# Install required dependencies for runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Create directory for the application
WORKDIR /app

# Copy the built executable from the build stage
COPY --from=build /app/bff/engine/build/main /app/main

# Expose the port the application listens on
EXPOSE 8080

# Run the application
CMD ["/app/main"]
