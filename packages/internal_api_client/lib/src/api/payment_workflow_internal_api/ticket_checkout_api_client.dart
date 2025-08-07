import 'package:dio/dio.dart';
import 'package:internal_api_client/src/model/id_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_checkout_api_client.g.dart';

@RestApi()
abstract class TicketCheckoutApiClient {
  factory TicketCheckoutApiClient(Dio dio, {String? baseUrl}) =
      _TicketCheckoutApiClient;

  /// チケットチェックアウトワークフローを開始します
  @PUT(
    '/proxy/payment-workflow-internal-api/ticket-checkout/{ticketCheckoutSessionId}',
  )
  Future<HttpResponse<IdResponse>> startTicketCheckoutWorkflow({
    @Path() required String ticketCheckoutSessionId,
  });
}
