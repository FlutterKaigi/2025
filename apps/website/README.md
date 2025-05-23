# FlutterKaigi 2025 ウェブサイト

## 環境構築

1. 初期化

   ```sh
   # dart pub getとbun installの実行
   make init
   ```

2. ビルド

   ```sh
   # buildディレクトリの作成
   make
   ```

3. 実行

   ```sh
   # bun devの実行
   make dev
   ```

## 設計

ウェブサイトはdartで実装しています．
dartでの実装のため，SPAを前提とした実装となっています．

また，今回は`packages:web`をベースとした最小構成での実装を目指しています．
情報量がそれほど多くはないこと，複雑な状態管理を必要としないだろうという観点から`packages:web`だけで行けるだろうという判断をしています．

そのため，サイトのコンテンツ作成は昔ながらのDOM操作が基本となりますが，JSと違ってdartは言語機能として豊富な構文が用意されているので，JSよりは書きやすい認識です．

### 参考リンク

- [packages:web Docs](https://pub.dev/documentation/web/latest/index.html)
- [MDN Web Docs](https://developer.mozilla.org/ja/)

### ディレクトリ構成

- `web/` 静的ファイル & 実行ファイル\
  一部のファイル(`main.dart`や`index.*`)を除いて，全てホスティング対象です．
  - `main.dart` dartの実行ファイル\
    これを起点にmain.wasmをビルドしています
  - `index.js` Cloudflare workersの実行ファイル\
    やっていることは`index.html`の中身を返しているだけです．
  - `bootstrap.js` Wasmを起動するためのJS
  - `style.css` サイト共通のデザイン情報を定義\
    基本的にコンポーネントごとのデザインは全て直接dart側で指定してください
- `lib/` dartのソースファイル
  - `app.dart` ウェブサイトの起点となる実装はここにまとめています．
  - `config.dart` ウェブサイトの設定項目はここにまとめています．
  - `text.dart` サイト内で利用する文言をまとめています．
  - `src/` ウェブサイトに必要な実装群はこの下に配置しています．
    - `routes/` ページごとのコンテンツはここに置いています．\
      `/foo/bar`といったパスを予定しているのであれば，
      `foo_bar.dart`のようなファイルを作ることを想定しています．
    - `routes.dart` ルーティング情報を記載しています．
- `test/` dartのテストファイル
