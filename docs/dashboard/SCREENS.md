# FlutterKaigi 2025 Dashboard アプリ 画面一覧

## 1. 概要

本ドキュメントは、FlutterKaigi 2025 の Dashboard アプリにおける画面一覧・画面遷移図をまとめたものです。

画面ID・カテゴリ・日本語名・英語名・実装種別・遷移種別を整理し、ユーザーの種別ごとの画面遷移についても記載します。

## 2. 画面一覧

<!-- deno-fmt-ignore-start -->
<!-- cspell:ignoreRegExp [A-Z]{1}-[A-Z]{4} -->
| ID | カテゴリ | 日本語名 | 英語名 | 実装種別 | 遷移種別 |
|-|-|-|-|-|-|
| L-SPLH | 起動 | スプラッシュ画面 | SplashScreen | Flutter | Replace |
| A-QJTR | 認証 | ログイン画面 | LoginScreen | Flutter | Replace |
| A-PLXM | - | Google認証画面 | GoogleAuthBottomSheet | InAppBrowser | BottomSheet |
| A-URVN | - | 招待コード入力画面 | InvitationCodeScreen | Flutter | Push |
| A-KYSD | - | アカウント作成エラーダイアログ | AccountCreationErrorDialog | Flutter | Dialog |
| D-HTFA | メイン | メイン画面 | MainScreen | Flutter | Replace |
| E-NSQJ | イベント | イベントタブ画面 | EventTabScreen | Flutter | Tab |
| E-GLMB | - | お知らせ画面 | NewsScreen | Flutter | Push |
| S-LKQZ | スポンサー | スポンサータブ画面 | SponsorTabScreen | Flutter | Tab |
| S-DFMW | - | 自社スポンサー画面 | OwnSponsorScreen | Flutter | Push |
| S-ABCN | - | 他社スポンサー画面 | OtherSponsorScreen | Flutter | Push |
| S-YTRO | - | ロゴ編集画面 | LogoEditScreen | Flutter | Modal |
| S-VXEI | - | 企業説明編集画面 | DescEditScreen | Flutter | Modal |
| S-PQSU | - | URL編集画面 | URLEditScreen | Flutter | Modal |
| K-EMQY | アカウント | アカウントタブ画面 | AccountTabScreen | Flutter | Tab |
| K-OVJL | - | プロフィール編集画面 | ProfileEditScreen | Flutter | Modal |
| K-XRPU | - | 退会申請画面 | WithdrawalScreen | Flutter | Modal |
<!-- deno-fmt-ignore-end -->

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
    Start((開始)) --> Splash[スプラッシュ画面]
    Splash --> SessionCheck{セッション確認}
    SessionCheck --> |有効| EventTab[イベントタブ画面]
    SessionCheck --> |無効| Login[ログイン画面]
    
    %% 認証フロー
    Login --> GoogleAuth((Google認証))
    GoogleAuth --> AccountCheck{アカウント存在確認}
    AccountCheck --> |存在する| EventTab[イベントタブ画面]
    AccountCheck --> |存在しない| InvitationCode[招待コード入力画面]
    
    %% 新規登録フロー
    InvitationCode --> DomainCheck{ドメイン一致確認}
    DomainCheck --> |一致| CreateAccount((アカウント作成))
    DomainCheck --> |不一致| RegisterError[アカウント作成<br>エラーダイアログ]
    RegisterError --> InvitationCode
    CreateAccount --> EventTab
    
    %% メイン画面のタブ構成
    subgraph Main[メイン画面]
      direction LR
      EventTab[イベントタブ画面]
      SponsorTab[スポンサータブ画面]
      Account[アカウントタブ画面]
    end

    EventTab --> News[お知らせ画面]
    
    SponsorTab --> OwnSponsor[自社スポンサー画面]
    SponsorTab --> OtherSponsor[他社スポンサー画面]
    
    OwnSponsor --> LogoEdit[ロゴ編集画面]
    OwnSponsor --> DescEdit[企業説明編集画面]
    OwnSponsor --> URLEdit[URL編集画面]
    
    Account --> Profile[プロフィール編集画面]
    Account --> Withdrawal[退会申請画面]
```
