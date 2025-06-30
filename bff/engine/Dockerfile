# Use the official Dart image as the base
FROM dart:stable AS build

# Install curl for downloading mise (needed for builder stage)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install mise
RUN curl https://mise.run | sh
ENV PATH="/root/.local/bin:${PATH}"

# Set up the working directory
WORKDIR /app

# Copy mise configuration
COPY mise.toml .

# Install tools defined in mise.toml (just dart for now)
RUN mise install

# Copy pubspec files first for dependency resolution
COPY pubspec.* ./
RUN dart pub get

# Copy the entire project
COPY . .

# Install dart_frog CLI globally
RUN dart pub global activate dart_frog_cli

# Generate a production build using dart_frog
RUN dart pub global run dart_frog_cli:dart_frog build

# Ensure packages are still up-to-date
RUN dart pub get --offline

# Compile the server to an executable
RUN dart compile exe build/bin/server.dart -o build/bin/server

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch

# Copy the runtime and the compiled server
COPY --from=build /runtime/ /
COPY --from=build /app/build/bin/server /app/bin/server

# Expose port
EXPOSE 8080

# Start the server
CMD ["/app/bin/server"]
