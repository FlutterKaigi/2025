# FlutterKaigi 2025 Dashboard アプリ 画面一覧

## 1. 概要

本ドキュメントは、FlutterKaigi 2025 の Dashboard アプリにおける画面一覧・画面遷移図をまとめたものです。

画面ID・カテゴリ・日本語名・英語名・実装種別・遷移種別を整理し、ユーザーの種別ごとの画面遷移についても記載します。

## 2. 画面一覧

<!-- deno-fmt-ignore-start -->
<!-- cspell:ignoreRegExp [A-Z]{1}-[A-Z]{4} -->
| ID | カテゴリ | 日本語名 | 英語名 | 実装種別 | 遷移種別 |
|-|-|-|-|-|-|
| A-QJTR | 認証 | ログイン画面 | LoginScreen | Flutter | Replace |
| A-PLXM | - | Google認証 | GoogleAuthScreen | InAppWebView | Modal |
| A-URVN | - | スポンサーコード入力画面 | SponsorCodeScreen | Flutter | Modal |
| A-KYSD | - | エラー画面 | RegisterErrorScreen | Flutter | Dialog |
| A-BWCE | - | アカウント作成 | CreateAccountScreen | Flutter | Modal |
| D-HTFA | メイン | ダッシュボード画面 | DashboardScreen | Flutter | Replace/Tab |
| K-EMQY | アカウント | アカウント管理画面 | AccountScreen | Flutter | Push |
| K-OVJL | - | プロフィール編集画面 | ProfileEditScreen | Flutter | Modal |
| K-XRPU | - | 退会申請画面 | WithdrawalScreen | Flutter | Modal |
| S-LKQZ | スポンサー | スポンサー情報画面 | SponsorInfoScreen | Flutter | Push |
| S-DFMW | - | 自社情報管理画面 | OwnSponsorInfoScreen | Flutter | Push |
| S-ABCN | - | 他社情報閲覧画面 | OtherSponsorInfoScreen | Flutter | Push |
| S-YTRO | - | ロゴ編集画面 | LogoEditScreen | Flutter | Modal |
| S-VXEI | - | 企業説明編集画面 | DescEditScreen | Flutter | Modal |
| S-PQSU | - | URL編集画面 | URLEditScreen | Flutter | Modal |
| E-NSQJ | イベント | イベント情報画面 | EventInfoScreen | Flutter | Push |
| E-TRWA | - | 日程・場所画面 | ScheduleScreen | Flutter | Push |
| E-GLMB | - | お知らせ一覧画面 | NewsScreen | Flutter | Push |
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
    Start[開始] --> Login[ログイン画面]
    
    %% 認証フロー
    Login --> GoogleAuth((Google認証))
    GoogleAuth --> AccountCheck{アカウント存在確認}
    AccountCheck --> |存在する| Dashboard[ダッシュボード画面]
    AccountCheck --> |存在しない| SponsorCode[スポンサーコード入力画面]
    
    %% 新規登録フロー
    SponsorCode --> DomainCheck{ドメイン一致確認}
    DomainCheck --> |一致| CreateAccount((アカウント作成))
    DomainCheck --> |不一致| RegisterError[エラー画面]
    CreateAccount --> Dashboard
    
    %% ダッシュボード以降の画面遷移
    Dashboard --> Account[アカウント管理画面]
    Dashboard --> SponsorInfo[スポンサー情報画面]
    Dashboard --> EventInfo[イベント情報画面]
    
    Account --> Profile[プロフィール編集画面]
    Account --> Withdrawal[退会申請画面]
    
    SponsorInfo --> OwnInfo[自社情報管理画面]
    SponsorInfo --> OtherInfo[他社情報閲覧画面]
    
    OwnInfo --> LogoEdit[ロゴ編集画面]
    OwnInfo --> DescEdit[企業説明編集画面]
    OwnInfo --> URLEdit[URL編集画面]
    
    EventInfo --> Schedule[日程・場所画面]
    EventInfo --> News[お知らせ一覧画面]
```
