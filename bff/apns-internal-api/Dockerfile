# ============================================
# Build stage
# ============================================
FROM swift:6.2.0-noble AS build

# Install OS dependencies
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get -q update \
    && apt-get -q dist-upgrade -y \
    && apt-get install -y \
        ca-certificates \
        tzdata \
        libssl-dev \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up workspace
WORKDIR /workspace

# Copy Package.swift and resolve dependencies
COPY Package.swift ./
RUN swift package resolve

# Copy source code
COPY Sources ./Sources

# Build the application
RUN swift build -c release --static-swift-stdlib \
    && mv $(swift build -c release --show-bin-path)/Run /workspace/Run

# ============================================
# Runtime stage
# ============================================
FROM ubuntu:noble-20241118.1

# Install runtime dependencies
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
    && apt-get -q update \
    && apt-get -q dist-upgrade -y \
    && apt-get install -y \
        ca-certificates \
        tzdata \
        libssl3t64 \
        libcurl4 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash -u 1000 vapor

# Set up workspace
WORKDIR /app

# Copy the built executable
COPY --from=build --chown=vapor:vapor /workspace/Run /app/

# Switch to non-root user
USER vapor:vapor

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Set environment
ENV LOG_LEVEL=info
ENV PORT=8080

# Run the application
ENTRYPOINT ["/app/Run"]
CMD ["serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]
