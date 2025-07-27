import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/payment_completion_api_client.dart';
import 'package:internal_api_client/src/api/ticket_checkout_api_client.dart';

/// Payment Workflow Internal APIクライアント
class InternalApiClient {
  InternalApiClient({required Dio dio, String? baseUrl})
    : _dio = dio,
      _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  /// チケットチェックアウトAPIクライアント
  TicketCheckoutApiClient get ticketCheckout => _baseUrl != null
      ? TicketCheckoutApiClient(_dio, baseUrl: _baseUrl)
      : TicketCheckoutApiClient(_dio);

  /// 支払い完了APIクライアント
  PaymentCompletionApiClient get paymentCompletion => _baseUrl != null
      ? PaymentCompletionApiClient(_dio, baseUrl: _baseUrl)
      : PaymentCompletionApiClient(_dio);
}
