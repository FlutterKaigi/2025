# FlutterKaigi 2025 Dashboard アプリ 画面一覧

## 1. 概要

本ドキュメントは、FlutterKaigi 2025 の Dashboard アプリにおける画面一覧・画面遷移図をまとめたものです。

画面ID・カテゴリ・日本語名・英語名・実装種別・遷移種別を整理し、ユーザーの種別ごとの画面遷移についても記載します。

## 2. 画面一覧

<!-- dprint-ignore-start -->
<!-- cspell:ignoreRegExp [A-Z]{1}-[A-Z]{4} -->
| ID | カテゴリ | 日本語名 | 英語名 | 実装種別 | 遷移種別 |
|-|-|-|-|-|-|
| L-SPLH | 起動 | スプラッシュ画面 | SplashScreen | Flutter | Replace |
| A-QJTR | 認証 | ログイン画面 | LoginScreen | Flutter | Replace |
| A-PLXM | - | Google認証画面 | GoogleAuthBottomSheet | InAppBrowser | BottomSheet |
| A-URVN | - | 招待コード入力画面 | InvitationCodeScreen | Flutter | Push |
| A-KYSD | - | アカウント作成エラーダイアログ | AccountCreationErrorDialog | Flutter | Dialog |
| D-HTFA | メイン | メイン画面 | MainScreen | Flutter | Replace |
| E-INFO | イベント | イベント情報画面 | EventInfoScreen | Flutter | - |
| E-GLMB | - | お知らせ画面 | NewsScreen | Flutter | Push |
| S-LIST | スポンサー | スポンサー一覧画面 | SponsorListScreen | Flutter | - |
| S-DETA | - | スポンサー詳細画面 | SponsorDetailScreen | Flutter | Push |
| S-YTRO | - | スポンサー編集画面 | SponsorEditScreen | Flutter | Modal |
| K-INFO | アカウント | アカウント情報画面 | AccountInfoScreen | Flutter | - |
| K-OVJL | - | プロフィール編集画面 | ProfileEditScreen | Flutter | Modal |
| K-XRPU | - | 退会申請画面 | WithdrawalScreen | Flutter | Modal |
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

### 3-1. スポンサー企業担当者向け

```mermaid
flowchart TD
    %% 画面一覧
    SplashScreen[スプラッシュ画面]
    LoginScreen[ログイン画面]
    GoogleAuthBottomSheet[Google認証画面]
    InvitationCodeScreen[招待コード入力画面]
    AccountCreationErrorDialog[アカウント作成<br>エラーダイアログ]
    subgraph MainScreen[メイン画面]
      direction LR
      subgraph EventTabScreen[イベントタブ画面]
        EventInfoScreen[イベント情報画面]
      end
      subgraph SponsorTabScreen[スポンサータブ画面]
        SponsorListScreen[スポンサー一覧画面]
      end
      subgraph AccountTabScreen[アカウントタブ画面]
        AccountInfoScreen[アカウント情報画面]
      end
    end
    NewsScreen[お知らせ画面]
    SponsorDetailScreen[スポンサー詳細画面]
    SponsorEditScreen[スポンサー編集画面]
    ProfileEditScreen[プロフィール編集画面]
    WithdrawalScreen[退会申請画面]

    Start((開始)) --> SplashScreen
    SplashScreen --> SessionCheck{セッション確認}
    SessionCheck --> |有効| EventInfoScreen
    SessionCheck --> |無効| LoginScreen
    
    %% 認証フロー
    LoginScreen --> GoogleAuthBottomSheet((Google認証))
    GoogleAuthBottomSheet --> AccountCheck{アカウント存在確認}
    AccountCheck --> |存在する| EventInfoScreen
    AccountCheck --> |存在しない| InvitationCodeScreen
    
    %% 新規登録フロー
    InvitationCodeScreen --> DomainCheck{ドメイン一致確認}
    DomainCheck --> |一致| CreateAccount((アカウント作成))
    DomainCheck --> |不一致| AccountCreationErrorDialog
    AccountCreationErrorDialog --> InvitationCodeScreen
    CreateAccount --> EventInfoScreen
    
    %% メイン画面以降のフロー
    EventInfoScreen --> NewsScreen
    SponsorListScreen --> SponsorDetailScreen
    SponsorDetailScreen --> SponsorEditScreen
    AccountInfoScreen --> ProfileEditScreen
    AccountInfoScreen --> WithdrawalScreen
```
