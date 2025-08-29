# FlutterKaigi 2025

This is the official repository for the FlutterKaigi 2025 conference. It contains the source code for the conference website, staff dashboard, and backend infrastructure.

## 🚀 Getting Started

For a complete guide on setting up your development environment, please see the [Getting Started Guide](./docs/GETTING_STARTED.md).

For the impatient, you can get started with the following commands:

```bash
# Install tool versions defined in .mise.toml
mise install

# Bootstrap the project (install dependencies, etc.)
mise run bootstrap
```

## 📚 About This Project

This project is a monorepo managed with [mise](https://mise.jdx.dev/) and [melos](https://melos.invertase.dev/). The project is organized into the following directories:

- **`/apps`**: Contains the frontend applications.
  - `dashboard`: A Flutter application for conference staff.
  - `website`: The official conference website, built with [Jaspr](https://jaspr.dev/).
- **`/bff`**: The Backend-For-Frontend layer, built with [Cloudflare Workers](https://workers.cloudflare.com/).
  - `engine`: The core logic written in Dart and compiled to WebAssembly.
  - `bridge`: A TypeScript bridge that invokes the Wasm module.
- **`/packages`**: Shared Dart and Flutter packages used across the project.
- **`/supabase`**: The [Supabase](https://supabase.com/) project, containing database migrations, schemas, and seeds.
- **`/terraform`**: Infrastructure as Code for the Supabase project, managed with [Terraform](https://www.terraform.io/).

## 🛠️ Technology Stack

- **Frontend:** Flutter, Jaspr
- **Backend:** Dart (Wasm), TypeScript, Cloudflare Workers
- **Database:** Supabase, PostgreSQL
- **Infrastructure:** Terraform, Docker
- **Tooling:** mise, melos, bun, dprint, biome, cspell

## ❤️ Contributing

We welcome contributions to the project! Before you get started, please read our [branching strategy](./docs/BRANCH.md).

This project uses a variety of tools to ensure code quality, including `dprint` for code formatting, `biome` for TypeScript linting, and `cspell` for spell checking. You can run all the necessary checks and formatting with the following command:

```bash
melos run fix
```
