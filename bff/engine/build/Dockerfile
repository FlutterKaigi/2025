FROM ubuntu:25.10 AS build

RUN apt-get update && apt-get install -y \
    sudo curl git ca-certificates unzip jq bash sed wget xz-utils

WORKDIR /app

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add user
RUN useradd -m -s /bin/bash -G sudo builder && \
	mkdir -p /mise && \
	chown -R builder:builder /mise && \
	chown -R builder:builder /app

# Switch to the builder user
USER builder

# Install flutter
ARG FLUTTER_VERSION=3.34.0-0.1.pre-beta
RUN wget -q -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/beta/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz && \
    tar -xf flutter.tar.xz && \
    rm flutter.tar.xz && \
	mkdir -p ~/.local && \
    mv flutter ~/.local/flutter

# Set the path to the flutter binary
ENV PATH="~/.local/flutter/bin:$PATH"

COPY --chown=builder:builder . .

# Install dependencies
RUN dart pub get

RUN cd bff/engine && \
	dart_frog build && \
	dart build 


# Use a minimal base image for the final stage.
FROM scratch

# Copy the built application from the build stage.
COPY --from=build /app/build /app/build

# Expose the port the application listens on.
EXPOSE 8080

# Run the application.
CMD ["/app/build/server.dart"]
