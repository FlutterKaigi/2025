# FlutterKaigi 2025 ウェブサイト

## 環境構築

### 開発時

1. 初期化

   ```sh
   # dart pub getとbun installの実行、Jasprのインストール
   make init
   ```

2. ビルド

   ```sh
   # jaspr serveの実行
   make dev
   ```

### 本番用ビルド

1. ビルド

   ```sh
   # buildディレクトリの作成
   make
   ```

2. 実行

   ```sh
   # bun devの実行
   make start
   ```

## 設計

ウェブサイトはdartで実装しています。
フレームワークとして [jaspr](https://pub.dev/packages/jaspr) を採用しており、
Flutterライクなコンポーネント定義でWebサイトを構築することができます。
また、デプロイ時にはSSGでのビルドを行う事によりパフォーマンスを考慮した設計としています。

### 参考リンク

- [packages:web Docs](https://pub.dev/documentation/web/latest/index.html)
- [Jaspr Docs](https://docs.jaspr.site/)
- [MDN Web Docs](https://developer.mozilla.org/ja/)

### ディレクトリ構成

- `web/` 静的ファイル & 実行ファイル\
  基本的にこの中身は全てホスティング対象です。
  - `index.js` Cloudflare workersの実行ファイル\
    やっていることは`index.html`の中身を返しているだけです。
  - `style.css` サイト共通のデザイン情報を定義\
    基本的にコンポーネントごとのデザインは全て直接dart側で指定してください。
- `lib/` dartのソースファイル
  - `main.dart` Jasprの起点となるファイルです。
  - `app.dart` ルーティング、基本的なレイアウトを定義しています。
  - `text.dart` サイト内で利用する文言をまとめています。
  - `src/` ウェブサイトに必要な実装群はこの下に配置しています。
    - `config/` ウェブサイトの設定項目はここにまとめています。
    - `pages/` ページごとのコンテンツはここに置いています。
    - `components/` 複数のページで使う、クライアントサイドで動かす必要がある等の\
      コンポーネントを定義しています。
    - `constants/` ソース内で使う定数はここにまとめています。
- `test/` dartのテストファイル
