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
    ```

1. 準備OKです! 開発頑張ってください💪

[`altive_lints`]: https://pub.dev/packages/altive_lints
[`custom_lint`]: https://pub.dev/packages/custom_lint
