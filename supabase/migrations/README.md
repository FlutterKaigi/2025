# supabase migration ディレクトリについて

本プロジェクトで利用するSupabaseのテーブルの定義は、supabaseのDeclarative Database Schema(宣言型データベーススキーマ)機能を利用しています。

> [!WARNING]
>
> [Declarative database schemas - Supabase]のドキュメントを確認し、最新の状況を確認してください

## スキーマ定義手段について

1. `bunx supabase stop` でローカルデータベースを停止します
1. `supabase/schemas`ディレクトリ配下にテーブル定義を追加/削除/変更する
1. `bunx supabase db diff -f [name]`でマイグレーションファイルを作成します

    - 基本的に、ファイル名は `[create/delete/add 等の接頭辞]_[テーブル名]_table`に従ってください
    - 複数列を追加した場合等は、それぞれファイルを分けるのではなく意味を持つ単位でファイルを分割することを推奨します

1. `bunx supabase start`でローカルデータベースを起動します。ローカルのダッシュボードから、想定通りのスキーマで実行されているかを確認してください

[Declarative database schemas - Supabase]: https://supabase.com/docs/guides/local-development/declarative-database-schemas#other-entities

## データベースの命名規則

- 大文字を利用しない
  - テーブル名, カラム名ともに大文字を利用しないでください
  - 複数単語をつなげる必要がある場合、snake_caseを用いること
    - BAD: `TableName`
    - GOOD: `table_name`
- テーブル名
  - 基本的に複数形を用いること
    - BAD: `user`
    - GOOD: `users`
- 列名
  - `flg`/`dt`等の略称は利用しない
    - `flag`/`datatime`
  - 日付を表す列は、`[受動態]_on`
    - `start_on`
  - 時刻を表す列は、`[受動態]_at`
    - `created_at`, `updated_at`
  - BOOL値を持つ列は常に肯定で示す
    - BAD: `is_not_purchased`
    - GOOD: `is_purchased`
