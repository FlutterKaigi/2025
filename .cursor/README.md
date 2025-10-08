# Cursor MCP Server 設定

このディレクトリには、Cursor IDE で使用する MCP (Model Context Protocol) Server の設定ファイルが含まれています。

## ファイル構成

- `mcp.json` - 実際の MCP Server 設定（個人用）
- `mcp.sample.json` - MCP Server 設定のサンプル（共有用）

## 利用可能なMCP Server

### Dart MCP Server

Dart と Flutter の開発を支援する MCP Server です。

**機能:**

- Dart コードの解析とリファクタリング
- Flutter プロジェクトの管理
- パッケージ依存関係の管理
- コード生成とテンプレート

**設定例:**

```json
{
  "mcpServers": {
    "dart": {
      "command": "mise",
      "args": [
        "exec",
        "--",
        "dart",
        "mcp-server",
        "--force-roots-fallback"
      ]
    }
  }
}
```

**前提条件:**

- [mise](https://mise.jdx.dev/) がインストールされていること
- Dart SDK がインストールされていること

### GitHub MCP Server

GitHub リポジトリとの連携を支援する MCP Server です。

**機能:**

- Issue、PR、コミットの管理
- リポジトリ情報の取得
- GitHub Actions の管理

**設定例:**

```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_TOKEN>"
      }
    }
  }
}
```

**前提条件:**

- Docker がインストールされていること
- GitHub Personal Access Token が必要

## セットアップ手順

1. `mcp.sample.json`を`mcp.json`にコピー
2. 必要に応じて設定をカスタマイズ
3. GitHub MCP Server を使用する場合は、Personal Access Token を設定
4. Cursor IDE を再起動

## 参考リンク

- [Dart MCP Server 公式ドキュメント](https://dart.dev/tools/mcp-server)
- [GitHub MCP Server](https://github.com/github/github-mcp-server)
- [MCP (Model Context Protocol) 仕様](https://modelcontextprotocol.io/)
