# Internal API Client

Payment Workflow Internal API用のDartクライアントライブラリです。

## 概要

このパッケージは、FlutterKaigi 2025プロジェクトの決済ワークフロー用内部APIとの通信を簡素化し、型安全性を提供します。

## 機能

- **チケットチェックアウトワークフロー**: チケット購入プロセスの開始と監視
- **支払い完了ワークフロー**: 支払い処理の完了と検証
- **型安全性**: Freezedを使用した厳密な型定義
- **非同期処理**: Future/awaitパターンによる非同期API呼び出し

## セットアップ

`pubspec.yaml`に依存関係を追加：

```yaml
dependencies:
  internal_api_client:
    path: ../packages/internal_api_client
```

## 使用例

### 基本的なセットアップ

```dart
import 'package:dio/dio.dart';
import 'package:internal_api_client/internal_api_client.dart';

// Dioクライアントを設定
final dio = Dio();
dio.options.baseUrl = 'https://your-api-domain.com';

// Internal API クライアントを初期化
final apiClient = InternalApiClient(
  dio: dio,
  baseUrl: 'https://your-api-domain.com',
);
```

### チケットチェックアウトワークフロー

```dart
// チケットチェックアウトワークフローを開始
try {
  final response = await apiClient.ticketCheckout
      .startTicketCheckoutWorkflow(
    ticketCheckoutSessionId: 'session_123',
  );
  
  final status = response.data;
  print('ワークフロー開始: ${status.status}');
} catch (e) {
  print('エラー: $e');
}

// ワークフローステータスを確認
try {
  final response = await apiClient.ticketCheckout
      .getTicketCheckoutWorkflowStatus(
    ticketCheckoutSessionId: 'session_123',
  );
  
  final status = response.data;
  switch (status.status) {
    case ContainerInstanceStatusEnum.queued:
      print('処理待ち中');
      break;
    case ContainerInstanceStatusEnum.running:
      print('処理中');
      break;
    case ContainerInstanceStatusEnum.complete:
      print('完了');
      break;
    case ContainerInstanceStatusEnum.errored:
      print('エラー: ${status.error}');
      break;
    default:
      print('ステータス: ${status.status}');
  }
} catch (e) {
  print('エラー: $e');
}
```

### 支払い完了ワークフロー

```dart
// PaymentIntentを作成
final paymentIntent = PaymentIntent(
  id: 'pi_123456',
  clientSecret: 'pi_123456_secret_abc',
  amount: 5000,
  currency: 'jpy',
  status: 'succeeded',
  customerId: 'cus_123',
  metadata: {
    'order_id': 'order_789',
    'event_id': 'flutterkaigi_2025',
  },
);

// 支払い完了ワークフローを開始
try {
  final response = await apiClient.paymentCompletion
      .startPaymentCompletionWorkflow(
    userId: 'user_123',
    ticketCheckoutId: 'checkout_456',
    paymentIntent: paymentIntent,
  );
  
  final status = response.data;
  print('支払い完了ワークフロー開始: ${status.status}');
} catch (e) {
  print('エラー: $e');
}

// 支払い完了ワークフローのステータスを確認
try {
  final response = await apiClient.paymentCompletion
      .getPaymentCompletionWorkflowStatus(
    ticketCheckoutId: 'checkout_456',
  );
  
  final status = response.data;
  if (status.status == ContainerInstanceStatusEnum.complete) {
    print('支払い処理が完了しました');
    if (status.output != null) {
      print('結果: ${status.output}');
    }
  }
} catch (e) {
  print('エラー: $e');
}
```

### エラーハンドリング

```dart
import 'package:dio/dio.dart';

try {
  final response = await apiClient.ticketCheckout
      .startTicketCheckoutWorkflow(
    ticketCheckoutSessionId: 'session_123',
  );
  // 成功時の処理
} on DioException catch (e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      print('接続タイムアウト');
      break;
    case DioExceptionType.receiveTimeout:
      print('受信タイムアウト');
      break;
    case DioExceptionType.badResponse:
      print('HTTPエラー: ${e.response?.statusCode}');
      break;
    default:
      print('通信エラー: ${e.message}');
  }
} catch (e) {
  print('予期しないエラー: $e');
}
```

## データモデル

### ContainerInstanceStatus

ワークフローの実行状態を表します：

```dart
enum ContainerInstanceStatusEnum {
  queued,      // 処理待ち
  running,     // 実行中
  paused,      // 一時停止
  errored,     // エラー
  terminated,  // 終了
  complete,    // 完了
  waiting,     // 待機
  waitingForPause,  // 一時停止待ち
  unknown,     // 不明
}
```

### PaymentIntent

支払い情報を表します：

```dart
class PaymentIntent {
  final String id;              // PaymentIntent ID
  final String clientSecret;    // クライアントシークレット
  final int amount;            // 金額（最小単位）
  final String currency;       // 通貨コード
  final String status;         // 支払いステータス
  final String? customerId;    // 顧客ID（オプション）
  final Map<String, dynamic>? metadata;  // メタデータ（オプション）
}
```

## 開発

### コード生成

モデルクラスやAPIクライアントの変更後は、以下のコマンドでコード生成を実行してください：

```bash
cd packages/internal_api_client
dart run build_runner build --delete-conflicting-outputs
```

### 分析

コードの品質を確認：

```bash
flutter analyze
```

## ライセンス

このプロジェクトはFlutterKaigi 2025の一部です。
