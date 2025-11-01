import 'package:dio/dio.dart';
import 'package:internal_api_client/src/model/id_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_refund_api_client.g.dart';

@RestApi()
abstract class TicketRefundApiClient {
  factory TicketRefundApiClient(Dio dio, {String? baseUrl}) =
      _TicketRefundApiClient;

  /// チケット返金ワークフローを開始します
  @PUT(
    '/proxy/payment-workflow-internal-api/ticket-refund/{ticketPurchaseId}',
  )
  Future<HttpResponse<IdResponse>> startTicketRefundWorkflow({
    @Path() required String ticketPurchaseId,
  });
}
