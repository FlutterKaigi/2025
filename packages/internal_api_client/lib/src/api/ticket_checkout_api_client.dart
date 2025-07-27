import 'package:dio/dio.dart';
import 'package:internal_api_client/src/model/container_instance_status.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_checkout_api_client.g.dart';

@RestApi()
abstract class TicketCheckoutApiClient {
  factory TicketCheckoutApiClient(Dio dio, {String? baseUrl}) =
      _TicketCheckoutApiClient;

  /// チケットチェックアウトワークフローを開始します
  @PUT('/ticket-checkout/{ticketCheckoutSessionId}')
  Future<HttpResponse<ContainerInstanceStatus>> startTicketCheckoutWorkflow({
    @Path() required String ticketCheckoutSessionId,
  });

  /// チケットチェックアウトワークフローのステータスを取得します
  @GET('/ticket-checkout/{ticketCheckoutSessionId}')
  Future<HttpResponse<ContainerInstanceStatus>>
      getTicketCheckoutWorkflowStatus({
    @Path() required String ticketCheckoutSessionId,
  });
}
