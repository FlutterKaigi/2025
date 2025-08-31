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
| A-URVN | - | 招待コード入力画面 | InvitationCodeScreen | Flutter | Push | 要認証時 |
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
    SocialAuthBottomSheet[Google/Apple認証画面]
    InvitationCodeScreen[招待コード入力画面]
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
        AccountInfoScreen[アカウント情報画面<br>※匿名時はログインボタン表示]
      end
    end
    NewsScreen[お知らせ画面]
    SessionDetailScreen[セッション詳細画面]
    SponsorDetailScreen[スポンサー詳細画面]
    ProfileEditScreen[プロフィール編集画面]
    WithdrawalScreen[退会申請画面]

    Start((開始)) --> SplashScreen
    SplashScreen --> AnonymousLogin((匿名ログイン自動実行))
    AnonymousLogin --> EventInfoScreen
    
    %% アカウント情報画面からの認証フロー
    AccountInfoScreen --> AuthCheck{認証状態確認}
    AuthCheck --> |未認証| SocialAuthBottomSheet((Google/Apple認証))
    AuthCheck --> |認証済み| ProfileEditScreen
    AuthCheck --> |認証済み| WithdrawalScreen
    
    %% 認証フロー
    SocialAuthBottomSheet --> AccountCheck{アカウント存在確認}
    AccountCheck --> |存在する| AccountInfoScreen
    AccountCheck --> |存在しない| InvitationCodeScreen
    
    %% 新規登録フロー
    InvitationCodeScreen --> DomainCheck{ドメイン一致確認}
    DomainCheck --> |一致| CreateAccount((アカウント作成))
    DomainCheck --> |不一致| AccountCreationErrorDialog
    AccountCreationErrorDialog --> InvitationCodeScreen
    CreateAccount --> AccountInfoScreen
    
    %% メイン画面以降のフロー（匿名でも利用可能）
    EventInfoScreen --> NewsScreen
    SessionListScreen --> SessionDetailScreen
    SponsorListScreen --> SponsorDetailScreen
```

### 3-2. スポンサー企業担当者向け

```mermaid
flowchart TD
    %% 画面一覧
    SplashScreen[スプラッシュ画面]
    SocialAuthBottomSheet[Google/Apple認証画面]
    InvitationCodeScreen[招待コード入力画面]
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
        AccountInfoScreen[アカウント情報画面<br>※匿名時はログインボタン表示]
      end
    end
    NewsScreen[お知らせ画面]
    SessionDetailScreen[セッション詳細画面]
    SponsorDetailScreen[スポンサー詳細画面]
    ProfileEditScreen[プロフィール編集画面]
    WithdrawalScreen[退会申請画面]

    Start((開始)) --> SplashScreen
    SplashScreen --> AnonymousLogin((匿名ログイン自動実行))
    AnonymousLogin --> EventInfoScreen
    
    %% アカウント情報画面からの認証フロー
    AccountInfoScreen --> AuthCheck{認証状態確認}
    AuthCheck --> |未認証| SocialAuthBottomSheet((Google/Apple認証))
    AuthCheck --> |認証済み| ProfileEditScreen
    AuthCheck --> |認証済み| WithdrawalScreen
    
    %% 認証フロー（企業担当者の場合）
    SocialAuthBottomSheet --> AccountCheck{アカウント存在確認}
    AccountCheck --> |存在する| AccountInfoScreen
    AccountCheck --> |存在しない| InvitationCodeScreen
    
    %% 新規登録フロー（企業担当者の場合）
    InvitationCodeScreen --> DomainCheck{ドメイン一致確認}
    DomainCheck --> |一致| CreateAccount((アカウント作成))
    DomainCheck --> |不一致| AccountCreationErrorDialog
    AccountCreationErrorDialog --> InvitationCodeScreen
    CreateAccount --> AccountInfoScreen
    
    %% メイン画面以降のフロー（匿名でも利用可能）
    EventInfoScreen --> NewsScreen
    SessionListScreen --> SessionDetailScreen
    SponsorListScreen --> SponsorDetailScreen
```
