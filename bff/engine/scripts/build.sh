#!/bin/bash

set -eux

# CI環境ではビルドをスキップ
if [ "${CI:-false}" = "true" ]; then
  echo "CI is true, skipping build."
  echo "Please put the WASM file in bff/bridge/engine-artifact."
  exit 0
fi


# Unoptimized build
echo "Building unoptimized wasm..."
dart compile wasm lib/main.dart -o ../bridge/engine-artifact/main.wasm -O0
echo "Unoptimized wasm build completed."
