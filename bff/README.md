# FlutterKaigi 2025 BFF

## 概要

- FlutterKaigi 2025の各種アプリケーション, Webサイトが利用するBFFを格納しています
- BFFはCloudflare Workersにデプロイされます
- 2つのディレクトリに分かれています
  - `engine`: Dart製のBFF (WebAssemblyにコンパイルされます)
  - `bridge`: TypeScript製 (`engine`のWebAssemblyを呼び出します)
  - 詳しい技術仕様についてはドキュメントをご覧ください (現在作成中)

## 開発

1. Supabaseに関する環境変数をセットする
   - `bridge/.dev.vars`を作成し、`bridge/.dev.vars.example`を参考に環境変数をセットします

1. `bff/bridge`に移動し、以下のコマンドを実行します
   - 依存関係を解決し、開発サーバーを起動します

   ```bash
   bun install
   bun run dev
   ```
