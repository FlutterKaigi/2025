# FlutterKaigi Lints

このパッケージでは、FlutterKaigi 2025のDartプロジェクトで利用する各種Lintルールを定義しています。

## 使い方

1. `pubspec.yaml`に以下を追加

   (FlutterKaigi/2025配下の場合)

   ```yaml
   dependencies:
     flutterkaigi_lints:
       path: ../flutterkaigi_lints
   ```

   (他のリポジトリの場合)

   ```yaml
   dependencies:
     flutterkaigi_lints:
       git:
         url: https://github.com/FlutterKaigi/2025
         ref: main
   ```

1. 以下コマンドを実行し、[`altive_lints`], [`custom_lint`]を依存関係に追加

   ```bash
   dart pub add dev:altive_lints dev:custom_lint
   ```

1. `analysis_options.yaml`に以下を追加

   ```yaml
   include: package:flutterkaigi_lints/analysis_options.yaml

   custom_lint:
     rules:
       - avoid_hardcoded_color: false
       - avoid_hardcoded_japanese: false
   - prefer_clock_now: false
   ```

1. 準備OKです! 開発頑張ってください💪

[`altive_lints`]: https://pub.dev/packages/altive_lints
[`custom_lint`]: https://pub.dev/packages/custom_lint

## Q&A

### なぜ利用先プロジェクトの`analysis_options.yaml`にも`custom_lint`の`rules`を記載するのか?

A. `flutterkaigi_lints/lib/analysis_options.yaml`にも同様の項目を記載していますが、custom_lintが動く時に利用先のプロジェクトにある`analysis_options.yaml`の`custom_lint`オブジェクトのみを参照するためです。
それぞれのパッケージの`analysis_options.yaml`に`custom_lint`の`rules`を記載しない場合、`avoid_hardcoded_japanese`等のルールが無視されず警告されます。
