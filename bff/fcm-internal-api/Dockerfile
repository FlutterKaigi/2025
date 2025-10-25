FROM oven/bun:1.2.21-alpine AS base

WORKDIR /app

# Install dependencies
FROM base AS release
COPY . .
RUN bun install --frozen-lockfile

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

ENV FIREBASE_SERVICE_ACCOUNT_JSON=${FIREBASE_SERVICE_ACCOUNT_JSON}

CMD ["bun", "run", "src/index.ts"]
