#!/bin/bash

# APNs Internal API のテストスクリプト
# 使用方法: ./examples/test-api.sh

set -e

API_BASE_URL="${API_BASE_URL:-http://localhost:8080}"
API_KEY="${X_API_KEY:-your_api_key}"

echo "=== APNs Internal API Test ==="
echo "Base URL: $API_BASE_URL"
echo ""

# ヘルスチェック
echo "1. Health Check"
curl -s "$API_BASE_URL/health" | jq .
echo ""

# OpenAPI 仕様書を取得
echo "2. Get OpenAPI Specification"
curl -s "$API_BASE_URL/openapi.json" | jq '.info'
echo ""

# プッシュ通知のテスト（検証モード）
echo "3. Test Push Notification (Validate Only)"
curl -s -X POST "$API_BASE_URL/apns/push/batch" \
  -H "Content-Type: application/json" \
  -H "Proxy-Authorization: $API_KEY" \
  -d '{
    "notifications": [
      {
        "deviceToken": "test_device_token_12345",
        "notification": {
          "title": "Test Title",
          "subtitle": "Test Subtitle",
          "body": "This is a test notification",
          "badge": 1,
          "sound": "default"
        },
        "topic": "com.example.app",
        "priority": 10
      }
    ],
    "validateOnly": true
  }' | jq .
echo ""

# Live Activity のテスト（検証モード）
echo "4. Test Live Activity Update (Validate Only)"
curl -s -X POST "$API_BASE_URL/apns/live-activity/batch" \
  -H "Content-Type: application/json" \
  -H "Proxy-Authorization: $API_KEY" \
  -d '{
    "updates": [
      {
        "deviceToken": "test_live_activity_token_12345",
        "event": "update",
        "contentState": {
          "status": "in_progress",
          "message": "テスト中"
        },
        "timestamp": 1696896000,
        "topic": "com.example.app.push-type.liveactivity",
        "priority": 10
      }
    ],
    "validateOnly": true
  }' | jq .
echo ""

echo "=== Tests completed ==="
