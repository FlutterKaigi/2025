import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/payment_workflow_internal_api/payment_completion_api_client.dart';
import 'package:internal_api_client/src/api/payment_workflow_internal_api/ticket_checkout_api_client.dart';
import 'package:internal_api_client/src/api/payment_workflow_internal_api/ticket_refund_api_client.dart';

class PaymentWorkflowInternalApi {
  PaymentWorkflowInternalApi({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  /// チケットチェックアウトAPIクライアント
  TicketCheckoutApiClient get ticketCheckout => TicketCheckoutApiClient(_dio);

  /// 支払い完了APIクライアント
  PaymentCompletionApiClient get paymentCompletion =>
      PaymentCompletionApiClient(_dio);

  /// チケット返金APIクライアント
  TicketRefundApiClient get ticketRefund => TicketRefundApiClient(_dio);
}
