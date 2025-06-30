# Use the official Dart image as the base
FROM dart:3.9.0-beta as builder

# Install curl for downloading mise
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install mise
RUN curl https://mise.run | sh
ENV PATH="/root/.local/bin:${PATH}"

# Set up the working directory
WORKDIR /app

# Copy mise configuration
COPY mise.toml .

# Install tools defined in mise.toml
RUN mise install

# Copy the entire project
COPY . .

# Get dependencies
RUN dart pub get

# Build the application
RUN dart compile exe main.dart -o build/main

# Create a minimal runtime image
FROM debian:12-slim

# Install OpenSSL for secure HTTP requests
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash appuser

# Set working directory
WORKDIR /app

# Copy the compiled binary from builder
COPY --from=builder /app/build/main /app/main

# Change ownership to appuser
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Run the application
CMD ["./main"]
