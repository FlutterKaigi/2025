#!/bin/bash

# APNs Internal API サーバー起動スクリプト

set -e

echo "=== APNs Internal API Server ==="
echo ""

# .env ファイルが存在するかチェック
if [ -f .env ]; then
    echo "✓ Loading environment variables from .env"
    source .env
else
    echo "⚠️  .env file not found"
    echo ""
    echo "Please create a .env file with your configuration:"
    echo "  cp env.sample .env"
    echo "  # Edit .env and set your actual values"
    echo "  source .env"
    echo ""
    exit 1
fi

# 必須環境変数のチェック
REQUIRED_VARS=("X_API_KEY" "APNS_KEY_ID" "APNS_TEAM_ID" "APNS_PRIVATE_KEY")
MISSING_VARS=()

for var in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!var}" ]; then
        MISSING_VARS+=("$var")
    fi
done

if [ ${#MISSING_VARS[@]} -ne 0 ]; then
    echo "❌ Missing required environment variables:"
    for var in "${MISSING_VARS[@]}"; do
        echo "  - $var"
    done
    echo ""
    echo "Please set these variables in your .env file"
    exit 1
fi

echo "✓ All required environment variables are set"
echo ""

# Swift がインストールされているかチェック
if ! command -v swift &> /dev/null; then
    echo "❌ Swift not found"
    echo ""
    echo "Please install Swift using mise:"
    echo "  cd .. && mise install"
    exit 1
fi

echo "✓ Swift $(swift --version | head -n 1)"
echo ""

# 依存関係を解決
echo "📦 Resolving dependencies..."
swift package resolve

echo ""
echo "🚀 Starting server..."
echo "   Environment: ${APNS_ENVIRONMENT:-sandbox}"
echo "   Port: ${PORT:-8080}"
echo "   Log Level: ${LOG_LEVEL:-info}"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# サーバーを起動
swift run
