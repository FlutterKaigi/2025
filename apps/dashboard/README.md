# FlutterKaigi 2025 Dashboard Application

[WIP]

## 開発

1. 依存関係を解決する

    ```bash
    flutter pub get
    ```

1. Swift Package Managerを有効にする
    - 本プロジェクトでは、Swift Package Managerを使用しています
    - 以下のコマンドを実行して、Swift Package Managerを有効にします
      - PC全体でSwift Package Managerを有効になるので、注意してください
    - 参考: [Swift Package Manager for app developers - Flutter](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers)

    ```bash
    # Swift Package Managerを有効にする
    flutter config --enable-swift-package-manager
    ```

1. アプリケーションを開始する

    ```bash
    flutter run -d {任意のデバイス}
    ```
