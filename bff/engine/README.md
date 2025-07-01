# BFF Engine - Dart Frog

FlutterKaigi 2025 BFF API server built with Dart Frog.

This project has been migrated from WebAssembly/Cloudflare Workers to Dart VM using dart_frog framework.

## Features

- REST API endpoints
- Supabase integration
- User authentication
- Health check endpoint
- Docker support with mise

## API Endpoints

- `GET /` - API information
- `GET /health` - Health check
- `GET /v1/users/me` - Get current user information

## Development

### Prerequisites

- Dart SDK 3.9.0-100.2.beta or later
- mise (for tool management)

### Setup

1. Install dependencies:
```bash
dart pub get
```

2. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your Supabase configuration
```

3. Run the development server:
```bash
dart_frog dev
```

The server will be available at http://localhost:8080

### Using mise

You can use mise for task management:

```bash
# Install tools
mise install

# Build the application
mise run build

# Run development server
mise run dev

# Run tests
mise run test
```

## Docker

### Build and run with Docker

```bash
docker build -t bff-engine .
docker run -p 8080:8080 bff-engine
```

### Use Docker Compose

```bash
# Development
docker compose up

# Production with nginx
docker compose --profile production up
```

## Environment Variables

- `SUPABASE_URL` - Your Supabase project URL
- `SUPABASE_SERVICE_ROLE_KEY` - Your Supabase service role key
- `PORT` - Server port (default: 8080)
- `HOST` - Server host (default: 0.0.0.0)

## Architecture

The application uses:
- **dart_frog** - Web framework
- **Supabase** - Backend as a Service
- **Riverpod** - Dependency injection
- **Docker** - Containerization
- **mise** - Tool management
