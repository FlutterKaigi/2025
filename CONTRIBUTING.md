# Contributing

あなたのコントリビュートをお待ちしております！

## はじめに

FlutterKaigi 2025 のアプリケーション開発にご興味をお持ちいただきありがとうございます！

このガイドでは、プロジェクトへの貢献方法を段階的に説明します。初めての方でも安心して取り組めるよう、丁寧に解説していきます。

### 関連ドキュメント

コントリビュートを始める前に、以下のドキュメントを確認することをお勧めします。

- **[README.md](README.md)**: プロジェクトの概要とアーキテクチャ
- **[docs/GETTING_STARTED.md](docs/GETTING_STARTED.md)**: 環境構築と開発ガイドライン
- **[docs/BRANCH.md](docs/BRANCH.md)**: ブランチ運用ルールと命名規則
- **[apps/app/README.md](apps/app/README.md)**: メインアプリの詳細情報

## ステップバイステップのコントリビュート方法

### 1. ソースコードをダウンロードする

まずリポジトリをローカルにダウンロードして実行することで、アプリを試してみましょう。アプリの使い方や機能を理解するのに役立ちます。

リポジトリの右上にある `Fork` ボタンをクリックしてください。これであなたのアカウントにリポジトリがコピーされます。

そのあと、以下のコマンドを実行してください。

```bash
git clone https://github.com/[あなたのアカウント]/2025
cd 2025
```

これでリポジトリがあなたの PC にダウンロードされます。

### 2. 環境をセットアップしてアプリを実行する

環境構築の詳細な手順は **[docs/GETTING_STARTED.md](docs/GETTING_STARTED.md)** を参照してください。

以下、簡単な手順をご紹介します。

```bash
# 必要なツールと依存関係をインストール
mise run bootstrap

# Swift Package Manager を有効化（iOS 開発の場合、初回のみ）
flutter config --enable-swift-package-manager

# アプリを実行
cd apps/app
flutter run -d {device} --dart-define-from-file=environments/.env.prod
```

### 3. タスクを見つける

タスク管理に GitHub Issue を使っています。[GitHub Issues ページ](https://github.com/FlutterKaigi/2025/issues) でコントリビュートしたい Issue を探してください。

#### おすすめの Issue ラベル

初めての方や、取り組みやすいタスクを探している方には、以下のラベルが付いた Issue がおすすめです。

- [`good first issue`](https://github.com/FlutterKaigi/2025/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22): 初めてのコントリビュートにおすすめのタスク
- [`help wanted`](https://github.com/FlutterKaigi/2025/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22): コミュニティからの貢献を歓迎しているタスク

#### 難易度別ラベル

タスクの難易度は以下のラベルで示されています。

- **`difficulty/easy`**: 簡単なタスク（初心者向け）
- **`difficulty/medium`**: 普通のタスク（ある程度の経験が必要）
- **`difficulty/hard`**: 難しいタスク（高度な知識や経験が必要）

#### Issue がない場合

新しい機能やバグ修正など、Issue がない Pull Request も歓迎します。その場合は、Pull Request の説明に以下の情報を詳細に記載してください。

- **理由**: なぜこの変更が必要か
- **原因**: 問題の根本原因（バグ修正の場合）
- **解決策**: どのようにして問題を解決したか、どのような機能を実装したか

### 4. コントリビュートを始める

もし取り組みたいタスクを見つけたら、他の人と重複して作業しないようにするため Issue に「🙋」などのコメントをしてください。

なるべく早くいただいたコメントにリアクションしますが、Issue にコメントを書いたらタスクに着手していただいて構いません！

フォークしたリポジトリで新しいブランチを作り、作業を始めてください。

ブランチ命名規則やリリース戦略の詳細は **[docs/BRANCH.md](docs/BRANCH.md)** を参照してください。

```bash
# ブランチを作成（例）
git checkout -b feat/GH-{issue番号}/{簡潔な説明}
```

### 5. 開発する

アプリのコードを変更し、開発しましょう！

詳細な開発ガイドラインとコマンドについては、以下を参照してください。

- **[docs/GETTING_STARTED.md](docs/GETTING_STARTED.md)**: 開発ワークフロー、コマンド一覧
- **[apps/app/README.md](apps/app/README.md)**: apps/app 固有の開発情報

#### よく使うコマンド

```bash
# コード生成（モデル、ルーター、プロバイダーを変更した時）
melos run gen

# フォーマット
melos run format

# 静的解析
cd apps/app && flutter analyze

# テスト実行
melos run test
```

#### Pull Request 作成前のチェックリスト

以下を必ず実行してください。

```bash
# 1. コード生成
melos run gen

# 2. フォーマットチェック
melos run format:check

# 3. 静的解析
cd apps/app && flutter analyze

# 4. カスタム Lint
melos run fix:custom
```

### 6. プルリクエストを作成する

変更が完了したら、プルリクエストを作成してください。

#### プルリクエスト作成の手順

1. **変更をコミットする**

```bash
# 変更をステージング
git add .

# コミット（Conventional Commits 形式を推奨）
git commit -m "feat(session): セッションフィルター機能を追加"

# リモートにプッシュ
git push origin feat/GH-{issue番号}/{簡潔な説明}
```

2. **GitHub でプルリクエストを作成する**

GitHub の UI（ https://github.com/[あなたのアカウント]/2025 ）からプルリクエストを作成します。

プルリクエストを作成すると、テンプレート（`.github/PULL_REQUEST_TEMPLATE.md`）が表示されますので、以下の情報を記載してください。

- **概要**: 変更の目的と背景
- **変更内容**: 具体的な変更点のリスト
- **テスト**: 動作確認した項目のチェックリスト
- **関連 Issue**: `Closes #123` 形式で記載（自動的に Issue がクローズされます）
- **スクリーンショット**: UI の変更がある場合は、変更前後のスクリーンショットを添付

### 7. コードレビュー、マージ

プルリクエストの作成が終わると、コードレビューのプロセスが始まります。

#### レビュープロセス

1. **レビュー待ち**: メンテナーがプルリクエストを確認します
2. **フィードバック**: 修正が必要な場合、差分にインラインコメントがつきます
3. **修正対応**: コメントを確認し、必要に応じて修正を行ってください
4. **再レビュー**: 修正が完了したら、レビュアーに再度確認してもらいます
5. **承認とマージ**: すべての確認が完了したら、プルリクエストがマージされます

#### 修正が必要な場合

レビューで修正を依頼された場合は、同じブランチで修正をコミットして push してください。

```bash
# 修正を加える
git add .
git commit -m "fix: レビュー指摘事項を修正"
git push origin feat/GH-{issue番号}/{簡潔な説明}
```

自動的にプルリクエストに反映されます。

## 議論や提案の方法

### 新機能や改善の提案

新しい機能の追加や大きなリファクタリングを行いたい場合は、**事前に Issue で相談してください**。

以下のような場合は、特に Issue での事前相談を推奨します。

- アーキテクチャに影響する変更
- 複数のファイルにまたがる大規模な変更
- 新しい依存関係の追加
- パフォーマンスに影響する変更

### Pull Request での提案

小規模な改善や明確な解決策がある場合は、Issue なしで直接 Pull Request を作成しても構いません。その場合は、Pull Request の説明に提案の背景と理由を詳しく記載してください。

## 重要な注意点

### コミットメッセージの書き方

**分かりやすく、簡潔に**書いてください。

コミットメッセージは [Conventional Commits](https://www.conventionalcommits.org/) 形式を推奨します。

```
{type}({scope}): {description}

[optional body]
```

**タイプの例は以下の通りです。**

- `feat`: 新機能
- `fix`: バグ修正
- `docs`: ドキュメントのみの変更
- `style`: コードの意味に影響を与えない変更（空白、フォーマットなど）
- `refactor`: バグ修正でも機能追加でもないコードの変更
- `test`: テストの追加や既存テストの修正
- `chore`: ビルドプロセスや補助ツールの変更

**具体例は以下の通りです。**

- `feat(session): セッションフィルター機能を追加`
- `fix(auth): ログイン時のタイムアウトエラーを修正`
- `docs(readme): セットアップ手順を更新`
- `refactor(profile): プロフィール画面のコンポーネントを分割`

### コード品質の確保

- テストが存在する場合は、`melos run test` でテストがパスすることを確認してください
- 新しい機能を追加する場合は、可能な限りテストも追加してください

### その他の注意事項

- 一つの Pull Request には一つの論理的な変更のみを含めてください
- 大きな変更は小さな Pull Request に分割することを検討してください
- コードフォーマットは `melos run format` で自動的に整形してください

## 最後に

分からないことがありましたら、遠慮なく Issue や Pull Request のコメントで質問してください！

コントリビュートを楽しみ、多くのことを学び、知識を共有し、FlutterKaigi を一緒に盛り上げましょう！
