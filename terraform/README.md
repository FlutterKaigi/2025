# FlutterKaigi 2025 Terraform

このディレクトリには、FlutterKaigi 2025プロジェクトで使用するインフラをTerraformで管理するためのコードが含まれています。

## 環境変数と秘密情報

このプロジェクトでは機密情報を安全に管理するために[SOPS]を使用しています。秘密情報は`.sops.yaml`の設定に従って暗号化されます。

また、`mise.toml`で設定されているように、秘密鍵ファイルは以下の場所に保存してください。ファイルを配置することで、miseによりSOPSの秘密鍵が自動で読み込まれ、復号された状態で環境変数に設定されます。

```yaml
[settings.sops]
age_key_file = "~/.config/mise/flutterkaigi.txt"
```

## 使い方

1. 管理者から`flutterkaigi.txt`を取得して`~/.config/mise/`に配置してください

- SOPSの秘密鍵が含まれています

1. `terraform init`でTerraformを初期化
1. `terraform plan`で変更内容を確認
1. `terraform apply`で変更を適用 (※ 通常GitHub Actionsから実行すること)
