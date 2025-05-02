# BFF Bridge

- `engine`によって生成されたWebAssemblyを呼び出すためのBridge
  - `engine`をトランスパイルして生成されたWebAssemblyは`engine-artifact`ディレクトリに格納されます
  - 具体的なビルドコマンドは、`wrangler.jsonc`の`build`セクションをご覧ください
- ビルドしたWebAssemblyを呼び出すためのコードは`src/index.ts`に記載されています
  - `__dart_cf_workers()`関数は、DartのJS Interopを通じてリクエスト情報等を渡すために利用されます
  - このコードはCloudflare Workersにデプロイされます
  - 詳しい技術仕様についてはドキュメントをご覧ください (現在作成中)
