import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/payment_workflow_internal_api/model/ticket_refund_request.dart';
import 'package:internal_api_client/src/model/id_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ticket_refund_api_client.g.dart';

@RestApi()
abstract class TicketRefundApiClient {
  factory TicketRefundApiClient(Dio dio, {String? baseUrl}) =
      _TicketRefundApiClient;

  /// チケット返金ワークフローを開始します
  @POST('/proxy/payment-workflow-internal-api/ticket-refund')
  Future<HttpResponse<IdResponse>> startTicketRefundWorkflow({
    @Body() required TicketRefundRequest request,
  });

  /// チケット返金ワークフローの状態を取得します
  @GET('/proxy/payment-workflow-internal-api/ticket-refund/{workflowId}')
  Future<HttpResponse<IdResponse>> getTicketRefundWorkflowStatus({
    @Path() required String workflowId,
  });
}

