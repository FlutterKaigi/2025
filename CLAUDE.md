# FlutterKaigi 2025

This repository contains FlutterKaigi 2025's application projects.

## Common Development Commands

### Project Bootstrap and Setup

```bash
# Initialize workspace (use mise for tool management)
mise run bootstrap

# Clean workspace
mise run clean

# Install dependencies
melos bootstrap
```

### Code Generation

```bash
# Generate all code (build_runner + l10n)
melos run gen

# Generate only build_runner code
melos run gen:build

# Generate with watch mode
melos run gen:build:watch

# Generate for uncommitted changes only
melos run gen:diff:head

# Generate for changes compared to main
melos run gen:diff:main
```

### Code Quality and Testing

```bash
# Run all tests (dart + flutter)
melos run test

# Format all code
melos run format

# Check formatting
melos run format:check

# Fix code issues
melos run fix

# Apply custom lint fixes
melos run fix:custom

# Analyze specific app
cd apps/app && flutter analyze
```

### Individual App Development

```bash
# Conference app
cd apps/app
flutter pub get
flutter config --enable-swift-package-manager  # First time only
flutter run -d {device}

# Website app
cd apps/website
make dev

# BFF development
cd bff/bridge
bun install
bun run dev
```

## Architecture Overview

This is a **monorepo** using **melos** for workspace management with three main application types:

### Apps Structure

- `apps/app/` - Flutter-based conference application for FlutterKaigi 2025
- `apps/app_catalog/` - Widgetbook catalog for conference components
- `apps/website/` - Static website built with Jaspr (Dart-based web framework)

### BFF (Backend for Frontend)

- `bff/engine/` - Dart-based BFF compiled to WebAssembly
- `bff/bridge/` - TypeScript bridge that calls the WebAssembly engine
- Deployed to Cloudflare Workers

### Shared Packages

- `packages/auth_client/` - Authentication client
- `packages/bff_client/` - BFF API client
- `packages/db_client/` - Database client
- `packages/db_types/` - Database type definitions
- `packages/flutterkaigi_lints/` - Custom lint rules

### Key Technologies

- **Flutter** with Swift Package Manager enabled
- **Dart** with code generation (build_runner, freezed, json_annotation)
- **TypeScript/JavaScript** with Bun runtime
- **Supabase** for database and authentication
- **Cloudflare Workers** for BFF deployment

## Development Workflow

### Branch Strategy

- Main development branch: `main`
- Feature branches: `feat/GH-{issue}/description`
- Bug fixes: `fix/GH-{issue}/description`
- Other types: `docs/`, `chore/`, `ci/`, `refactor/`, `style/`, `test/`, `build/`, `perf/`
- Keep branches short-lived (target 1 week merge cycle)

### Code Generation Requirements

- Run `melos run gen` after adding new models or routers
- Generated files use `.g.dart`, `.freezed.dart`, and `.gen.dart` extensions
- Localization files are generated with `flutter gen-l10n`

### Environment Setup

- Use `mise` for tool version management
- Flutter requires Swift Package Manager enabled: `flutter config --enable-swift-package-manager`
- Supabase environment variables required for BFF development

## Important Notes

- **Always run** code generation after model/router changes
- **Use melos commands** for workspace-wide operations
- **Check formatting** before committing: `melos run format:check`
- **Run tests** before pushing: `melos run test`
- The project uses **Japanese** as the primary language for documentation and UI
