# FlutterKaigi 2025 アプリ 画面一覧

## 1. 概要

本ドキュメントは、FlutterKaigi 2025 のアプリにおける画面一覧・画面遷移図をまとめたものです。

画面ID・カテゴリ・日本語名・英語名・実装種別・遷移種別を整理し、ユーザーの種別ごとの画面遷移についても記載します。

## 2. 画面一覧

<!-- dprint-ignore-start -->
<!-- cspell:ignoreRegExp [A-Z]{1}-[A-Z]{4} -->
| ID | カテゴリ | 日本語名 | 英語名 | 実装種別 | 遷移種別 | 権限 |
|-|-|-|-|-|-|-|
| L-SPLH | 起動 | スプラッシュ画面 | SplashScreen | Flutter | Replace | 全員 |
| A-PLXM | 認証 | Google/Apple認証画面 | SocialAuthBottomSheet | InAppBrowser | BottomSheet | 要認証時 |
| A-KYSD | - | アカウント作成エラーダイアログ | AccountCreationErrorDialog | Flutter | Dialog | 要認証時 |
| D-HTFA | メイン | メイン画面 | MainScreen | Flutter | Replace | 全員（匿名可） |
| E-INFO | イベント | イベント情報画面 | EventInfoScreen | Flutter | - | 全員（匿名可） |
| E-GLMB | - | お知らせ画面 | NewsScreen | Flutter | Push | 全員（匿名可） |
| E-SESS | - | セッション一覧画面 | SessionListScreen | Flutter | - | 全員（匿名可） |
| E-SEDT | - | セッション詳細画面 | SessionDetailScreen | Flutter | Push | 全員（匿名可） |
| E-FMAP | - | 会場フロアマップ画面 | VenueFloorMapScreen | Flutter | - | 全員（匿名可） |
| S-LIST | スポンサー | スポンサー一覧画面 | SponsorListScreen | Flutter | - | 全員（匿名可） |
| S-DETA | - | スポンサー詳細画面 | SponsorDetailScreen | Flutter | Push | 全員（匿名可） |
| K-INFO | アカウント | アカウント情報画面 | AccountInfoScreen | Flutter | - | 全員（匿名可） |
| K-OVJL | - | プロフィール編集画面 | ProfileEditScreen | Flutter | Modal | 認証ユーザー |
| K-XRPU | - | 退会申請画面 | WithdrawalScreen | Flutter | Modal | 認証ユーザー |
<!-- dprint-ignore-end -->

> [!NOTE]
>
> - 実装種別
>   - Flutter
>   - InAppWebView
>   - InAppBrowser
> - 遷移種別
>   - Push
>   - Replace
>   - Modal
>   - BottomSheet
>   - Dialog
>   - Tab
>   - External

## 3. 画面遷移図

### 3-1. カンファレンス参加者向け（匿名ログイン含む）

```mermaid
flowchart TD
    %% 画面一覧
    SplashScreen[スプラッシュ画面]
    LoginScreen[ログイン画面]
    SocialAuthBottomSheet[Google/Apple認証画面]
    AccountCreationErrorDialog[アカウント作成<br>エラーダイアログ]
    subgraph MainScreen[メイン画面]
      direction LR
      subgraph EventTabScreen[イベントタブ画面]
        EventInfoScreen[イベント情報画面]
      end
      subgraph SessionTabScreen[セッションタブ画面]
        SessionListScreen[セッション一覧画面]
      end
      subgraph VenueTabScreen[会場タブ画面]
        VenueFloorMapScreen[会場フロアマップ画面]
      end
      subgraph SponsorTabScreen[スポンサータブ画面]
        SponsorListScreen[スポンサー一覧画面]
      end
      subgraph AccountTabScreen[アカウントタブ画面]
        AccountInfoScreen[アカウント情報画面<br>※ログイン中のみ表示]
      end
    end
    NewsScreen[お知らせ画面]
    SessionDetailScreen[セッション詳細画面]
    SponsorDetailScreen[スポンサー詳細画面]
    ProfileEditScreen[プロフィール編集画面]
    WithdrawalScreen[退会申請画面]

    Start((開始)) --> SplashScreen
    SplashScreen --> LoginCheck{ログイン状態確認}
    LoginCheck --> |ログイン済み| EventInfoScreen
    LoginCheck --> |未ログイン| LoginScreen
    
    %% ログイン画面での選択
    LoginScreen --> LoginChoice{ログイン方法選択}
    LoginChoice --> |Googleログイン| SocialAuthBottomSheet
    LoginChoice --> |ゲストログイン| EventInfoScreen
    
    %% Google認証フロー
    SocialAuthBottomSheet --> AuthResult{認証結果}
    AuthResult --> |成功| EventInfoScreen
    AuthResult --> |失敗| AccountCreationErrorDialog
    AccountCreationErrorDialog --> LoginScreen
    
    %% アカウント情報画面からの遷移（ログイン中のみ表示されるため認証状態確認不要）
    AccountInfoScreen --> ProfileEditScreen
    AccountInfoScreen --> WithdrawalScreen
    
    %% メイン画面以降のフロー（匿名でも利用可能）
    EventInfoScreen --> NewsScreen
    SessionListScreen --> SessionDetailScreen
    SponsorListScreen --> SponsorDetailScreen
```
