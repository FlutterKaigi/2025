# FlutterKaigi 2025 BFF

## 概要

- FlutterKaigi 2025の各種アプリケーション, Webサイトが利用するBFFを格納しています
- BFFはCloudflare Workersにデプロイされます
- 2つのディレクトリに分かれています
  - `engine`: Dart製のBFF (WebAssemblyにコンパイルされます)
  - `bridge`: TypeScript製 (`engine`のWebAssemblyを呼び出します)
  - 詳しい技術仕様についてはドキュメントをご覧ください (現在作成中)
