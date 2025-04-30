# supabase migration ディレクトリについて

本プロジェクトで利用するSupabaseのテーブルの定義は、supabaseのDeclarative Database Schema(宣言型データベーススキーマ)機能を利用しています。

> [!WARNING]
>
> [Declarative database schemas - Supabase]のドキュメントを確認し、最新の状況を確認してください

## スキーマ定義手段について

1. `bun run supabase top` でローカルデータベースを停止します
1. `supabase/schemas`ディレクトリ配下にテーブル定義を追加/削除/変更する
1. `bun run supabase db diff -f [name]`でマイグレーションファイルを作成します

- 基本的に、ファイル名は `[create/delete/add 等の接頭辞]_[テーブル名]_table`に従ってください
- 複数列を追加した場合等は、それぞれファイルを分けるのではなく意味を持つ単位でファイルを分割することを推奨します

1. `bun run supabase start`でローカルデータベースを起動します。ローカルのダッシュボードから、想定通りのスキーマで実行されているかを確認してください

[Declarative database schemas - Supabase]: https://supabase.com/docs/guides/local-development/declarative-database-schemas#other-entities
